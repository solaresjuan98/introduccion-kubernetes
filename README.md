# Orquestación de Contenedores con Kubernetes

- [Orquestación de Contenedores con Kubernetes](#orquestación-de-contenedores-con-kubernetes)
  - [Pasos para realizar Ejemplo practico](#pasos-para-realizar-ejemplo-practico)
    - [:white\_check\_mark: Herramientas y plataformas utilizadas:](#white_check_mark-herramientas-y-plataformas-utilizadas)
    - [:white\_check\_mark: Arquitectura de las aplicaciones](#white_check_mark-arquitectura-de-las-aplicaciones)
    - [:white\_check\_mark: Aspectos importantes a tomar en cuenta](#white_check_mark-aspectos-importantes-a-tomar-en-cuenta)
  - [Dockerizar aplicaciones](#dockerizar-aplicaciones)
    - [¿Qué es artifact registry?](#qué-es-artifact-registry)
    - [Subir imagen de Backend](#subir-imagen-de-backend)
    - [Subir imagen de Frontend](#subir-imagen-de-frontend)
  - [Crear cluster de Kubernetes en Google Cloud Platform](#crear-cluster-de-kubernetes-en-google-cloud-platform)


## Pasos para realizar Ejemplo practico

### :white_check_mark: Herramientas y plataformas utilizadas:

* Google Cloud Platform
* Linux (opcional)
* Docker
* Linea de comandos de Google Cloud (gcloud)
* Linea de comandos de Kubectl

### :white_check_mark: Arquitectura de las aplicaciones



### :white_check_mark: Aspectos importantes a tomar en cuenta

Para poder realizar el ejemplo practico en Google Cloud Platform sin incurrir en gastos adicionales, se recomienda utilizar los $300.00 dolares que otorga Google Cloud como regalo al crear una nueva cuenta.

## Dockerizar aplicaciones

En este paso las aplicaciones tanto de backend y frontend serán dockerizadas y subidas a un registro de Google Cloud Platform, que en este caso será **Artifact Registry**.

### ¿Qué es artifact registry?

Google Artifact Registry es un servicio de administración y almacenamiento de artefactos de software que permite a los desarrolladores almacenar, administrar y distribuir imágenes de contenedores y paquetes de software en un registro privado seguro. Proporciona una solución integrada y escalable para almacenar y organizar activos como imágenes de Docker, paquetes de sistema y bibliotecas de código, lo que facilita el desarrollo, la implementación y la colaboración en proyectos de software.

Como alternativa, también existe el **Container Registry** de Google , el cual no se recomienda debido a que ya está obsoleto.

### Subir imagen de Backend


1. Generar build en Docker 

    ```
    docker build -t chat_backend .
    ```
2. Etiquetar y subir al registro

    ### Alternativa 1: Utilizando Artifact Registry

    ```Docker
    docker tag chat_backend us-central1-docker.pkg.dev/my-devops-project-392822/conferencia/chat_backend:latest
    ```

    ```
    docker push us-central1-docker.pkg.dev/my-devops-project-392822/conferencia/chat_backend:v3
    ```

    ### Alternativa 2: Container Container Registry

    ```
    docker tag ticket_server gcr.io/my-devops-project-392822/ejemplo/server:latest
    ```

    ```
    docker push gcr.io/my-devops-project-392822/ejemplo/server:latest
    ```


### Subir imagen de Frontend


1. Generar build en Docker 

    ```
    docker build -t chat_frontend .
    ```
2. Etiquetar y subir al registro

    ### Alternativa 1: Utilizando Artifact Registry

    ```Docker
    docker tag chat_frontend us-central1-docker.pkg.dev/my-devops-project-392822/conferencia/chatfrontend:latest
    ```

    ```
    docker push us-central1-docker.pkg.dev/my-devops-project-392822/conferencia/chatfrontend:latest
    ```

    ### Alternativa 2: Container Container Registry

    ```
    docker tag ticket_server gcr.io/my-devops-project-392822/ejemplo/server:latest
    ```

    ```
    docker push gcr.io/my-devops-project-392822/ejemplo/server:latest
    ```



## Crear cluster de Kubernetes en Google Cloud Platform

1. En la parte superior derecha de la pantalla seleccionar el icono de la terminal que está integrada en Google Cloud Plarform

    ![Terminal GCP](img/terminal.png)


2. Una vez abiera la terminal de GCP, ingresar el siguiente comando 

    ```sh
    gcloud container clusters create cluster-de-ejemplo \
        --num-nodes=2 \
        --machine-type=n1-standard-1 \
            --zone=us-central1-a
        --preemptible
    ```

    El comando anterior creará un cluster con las siguientes caracteristicas:

    * Nombre del clúster: cluster-de-ejemplo
    * Número de nodos: 2
    * Tipo de máquina: n1-standard-1
    * Zona: us-central1-a
    * Preemptible: Sí (se están utilizando nodos preemptibles)


    ### :warning: Importante tomar en cuenta: 
    * Para evitar incurrir en gastos adicionales, se recomienda crear un cluster zonal debiado a que los clústeres zonales tienden a ser más económicos pero con una menor alta disponibilidad, mientras que los clústeres regionales son más costosos pero ofrecen una alta disponibilidad superior. La elección entre ellos debe basarse en los requisitos de disponibilidad, capacidad financiera y otros factores relevantes para tu aplicación y cargas de trabajo.
    Por efecto se utilizar un cluster zonal.

    La creación del cluster puede tomar varios minutos.

3. Conectar a Kubectl (desde entorno local)

    Luego de crear el cluster de Kubernetes, se procede a conectar el cluster a la linea de comandos de Kubectl.

    * Actualizar zona con la que se está trabajando

    ```sh
    GCP_ZONE=us-east1-b
    ```

    ```sh
    gcloud config set compute/zone $GCP_ZONE
    ```
  
    * Obtener credenciales de cluster

    ```
    gcloud container clusters get-credentials cluster-de-ejemplo
    ```
