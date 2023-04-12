# Publish a Local Docker Image to microk8s

In this guide, we will demonstrate how to publish a locally built Docker image to microk8s. We will be using the following files in this test:

- Dockerfile
- ingress-my-nginx.yaml
- my-nginx.yaml (deployment)
- service-my-nginx.yaml

## Exporting the Docker Image
To build the image use this command:
```
docker build . -t mynginx:local
docker images
```

To export the Docker image, run the following command:
```
docker save mynginx > myimage.tar
```


This will create a `.tar` file named `myimage.tar` containing the `mynginx` Docker image.

## Importing the Docker Image to microk8s

To import the Docker image to microk8s, run the following command:

```
sudo microk8s ctr image import myimage.tar
```


This will import the `myimage.tar` file into microk8s.

## Deploying the Image to microk8s

To deploy the image to microk8s, use the `kubectl apply` command to apply the YAML files `my-nginx.yaml`, `service-my-nginx.yaml`, and `ingress-my-nginx.yaml`:

```
sudo microk8s kubectl apply -f my-nginx.yaml
sudo microk8s kubectl apply -f service-my-nginx.yaml
sudo microk8s kubectl apply -f ingress-my-nginx.yaml
```


This will create a deployment, a service, and an ingress for the `mynginx` Docker image in microk8s.

## Verifying the Deployment

To verify the deployment, run the following command:

```
sudo microk8s kubectl get pods
```


This will display a list of the pods running in microk8s. Verify that a pod for the `mynginx` deployment is running.

You can also verify the deployment by accessing the ingress URL in a web browser.

## Conclusion

In this guide, we demonstrated how to publish a locally built Docker image to microk8s by exporting the image, importing it to microk8s, and deploying it using YAML files.


## Extra content

## Load test
- Edit default index.html files on pods
- Fill 'N' char with correspondent number of pod to test load balancing
```
cat << EOF > /usr/share/nginx/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>
<p>POD N</p>
</body>
</html>
EOF
```
- Use the kubernetes web console or terminal:
```
sudo microk8s dashboard-proxy
```
