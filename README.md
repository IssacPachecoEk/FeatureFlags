# Terraform DevOps Prueba

## Objectivo

Diseñar la infraestructura utilizando Terraform, incluyendo:
▪ VPC con subredes públicas y privadas
▪ Grupos de seguridad para instancias de servidores web y bases de datos
▪ Instancia EC2 para el servidor web
▪ Instancia RDS para la base de datos.
▪ Depósito S3 para almacenar código de aplicación

## Indice

- ✅ [CODEPIPELINE](#codepipeline)
- ✅ [Ec2](#ec2)
- ✅ [S3](#s3)
- ✅ [RDS](#rds)
- ✅ [PROPUESTA](#propuesta)

#### CODEPIPELINE
Aqui se evidencia que se puedo desplegar en terraform desde el servicio "codepipeline", 
al igua que la arquitectura que se uso y en cual me base para hacer la mia propia.
![doc](documentation_images/arquitectura_codepipeline.png)
Referencia hecha por AWS oficial [enlance](https://docs.aws.amazon.com/es_es/prescriptive-guidance/latest/patterns/create-a-ci-cd-pipeline-to-validate-terraform-configurations-by-using-aws-codepipeline.html)
![doc](documentation_images/aws_referencia.png)
Evidencias
![doc](documentation_images/codepipeline_stages.png)
![doc](documentation_images/codepipeline_log.png)
#### Ec2
Se crea un instancia con dos subnet publica y privada, inicialmente se tenia planeado usar
los servicios de "ROUTE 53", "CERTIFICATE MANAGER" y "CLOUDWATCH", pero por cuestión de tiempo. 
No se puedo completar del todo; sin embargo, se tiene los modulos creados.
### instancia creada
![doc](documentation_images/running_instance.png)
### pagina web apache
![doc](documentation_images/ec2.png)
### llave de acceso al ec2 (necesario crear en la consola para poder acceder al ec2)
![doc](documentation_images/key_pair.png)
### vpc
![doc](documentation_images/vpc.png)
### subnet
![doc](documentation_images/subnet.png)
### ACL
![doc](documentation_images/acl.png)
### grupo de seguridad
![doc](documentation_images/grupo_de_seguridad.png)
### tabla de enrutamiento
![doc](documentation_images/route_table.png)
etiquedas homologadas
![doc](documentation_images/tags.png)
#### S3
Se sube todos los archivos de este proyecto en un bucket.
![doc](documentation_images/bucket_archivos.png)
#### RDS
### Se crea un base de datos en postgresql
![doc](documentation_images/acl.png)
#### PROPUESTA
adicionalmente, tengo una propuesta para organizar cada entorno por ambientes "DEV", "QA" y "PROD".
![doc](documentation_images/entornos_espeficios_estructura_propuesta.png)