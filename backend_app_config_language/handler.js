const http = require("http");

async function getAppConfig(url) {
  return new Promise((resolve, reject) => {
    const req = http.get(url, (res) => {
      if (res.statusCode < 200 || res.statusCode >= 300) {
        return reject(new Error("statusCode=" + res.statusCode));
      }
      var body = [];
      res.on("data", function (chunk) {
        body.push(chunk);
      });
      res.on("end", function () {
        resolve(Buffer.concat(body).toString());
      });
    });
    req.on("error", (e) => {
      reject(e.message);
    });
    req.end();
  });
}

async function getConfig() {
  let appconfigPort = 2772;

  const url =
    `http://localhost:${appconfigPort}` +
    `/applications/${process.env.APPCONFIG_APPLICATION}` +
    `/environments/${process.env.APPCONFIG_ENVIRONMENT}` +
    `/configurations/${process.env.APPCONFIG_CONFIGURATION}`;

  return await getAppConfig(url);
}

exports.myLanguages = async (event) => {
  try {
    console.log("get all config");
    const configData = await getConfig();
    const parsedConfigData = JSON.parse(configData);
    console.log(parsedConfigData);
    let language = "";
    if (parsedConfigData.featureFlagAttribute.ffString  === "English") {
      language = "EN";
    } else if (parsedConfigData.featureFlagAttribute.ffString === "Spanish") {
      language = "SPA";
    } else {
      console.warn("Unsupported language:", parsedConfigData.featureFlagAttribute.ffString );
    }
    console.log("language: " + language);
    const exMark = "!";
    const numExMark = parsedConfigData.featureFlagAttribute.ffInt;
    const endString = exMark.repeat(numExMark);
    console.log("endString: " + endString);
    let text = "";
    const trueTextEN = "featureFlagBoolean is true";
    const trueTextSPA = "featureFlagBoolean es verdadero";
    const falseTextEN = "featureFlagBoolean is false";
    const falseTextSPA = "featureFlagBoolean es falso";

    if (parsedConfigData.parsedBooleanFlag.enabled) {
      text = language === "EN" ? trueTextEN : trueTextSPA;
    } else {
      text = language === "EN" ? falseTextEN : falseTextSPA;
    }

    text += endString;
    console.log("text: " + text);
    return {
      statusCode: 200,
      body: JSON.stringify(text),
    };
  } catch (error) {
    console.error("Error:", error.message);
    return {
      statusCode: 500,
      body: JSON.stringify("Internal server error"),
    };
  }
};
