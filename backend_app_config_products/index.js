const fetch = require("node-fetch");
const dynamodb = require('aws-sdk/clients/dynamodb');

async function getConfig() {
  let appconfigPort = 2772;
  try {
    const url =
      `http://localhost:${appconfigPort}` +
      `/applications/${process.env.APPCONFIG_APPLICATION}` +
      `/environments/${process.env.APPCONFIG_ENVIRONMENT}` +
      `/configurations/${process.env.APPCONFIG_CONFIGURATION}`;

    const response = await fetch(url);
    const json = await response.json();
    return json;
  } catch (err) {
    console.error(err);
    throw err;
  }
}

const docClient = new dynamodb.DocumentClient();
const tableName = process.env.PRODUCT_TABLE;

async function getProducts() {
  const config = await getConfig();
  console.log(config);
  let attributesToGet = '';
  if (config.show_stock.enabled) {
    attributesToGet = ['id', 'itemName', 'itemDesc', 'itemPrice', 'itemImage', 'itemStock'];
} else {
      attributesToGet = ['id', 'itemName', 'itemDesc'];
  }
  const params = {
    TableName: tableName,
    AttributesToGet: attributesToGet,
  };
  const data = await docClient.scan(params).promise();
  return data;
}

exports.handler = async(event) => {
  const data = await getProducts();

  const response = {
    statusCode: 200,
    body: JSON.stringify(data.Items),
  };

  return response;
};
