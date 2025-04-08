docker-k3s-ghcr-test
Kubernetes Smoke Test
This project demonstrates a complete CI/CD pipeline using GitHub Actions, Docker, and Kubernetes with K3s.
It builds and pushes a Docker image to both Docker Hub and GitHub Container Registry (GHCR), and then deploys the image to a lightweight K3s cluster for testing.

Features
Docker image build and push (GHCR and Docker Hub)

Secure authentication via GitHub secrets

Deployment to a temporary K3s cluster using GitHub Actions

Automated smoke testing after deployment

Health checks for container validation

Dynamic deployment using environment variables

Technologies Used
Docker

GitHub Actions

Kubernetes (K3s via K3d)

GHCR (GitHub Container Registry)

Docker Hub

Shell Scripting

Nginx (as sample app)

How It Works
Workflow is triggered on push to the 'main' branch

Docker image is built and tagged as 'latest'

Image is pushed to GHCR and Docker Hub

A temporary K3s cluster is created using AbsaOSS/K3d-action

A kubectl deployment is applied using the built image

A smoke test runs to verify the deployment response

Pod status, logs, and rollout events are printed on failure for debugging

Deployment Notes
The image tag is passed to the deployment via the 'TESTING_NAME' environment variable

Deployment uses 'envsubst' to inject the image dynamically

Health checks ensure the container is serving correctly before marking the rollout as complete

To Run Manually
You can clone and test locally using:

bash
Copiar
Editar
docker build -t my-nginx .
docker run -p 8080:80 my-nginx
To deploy in K3d manually:

bash
Copiar
Editar
k3d cluster create my-cluster
kubectl apply -f manifests/deployment.yaml
