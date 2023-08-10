# Obtener información sobre los nodos del clúster
kubectl get nodes

# Obtener información sobre los pods en un namespace
kubectl get pods -n <namespace>

# Ver los logs de un pod
kubectl logs <pod-name> -n <namespace>

# Ver la descripción detallada de un pod
kubectl describe pod <pod-name> -n <namespace>

# Ejecutar un comando en un pod (por ejemplo, una terminal interactiva)
kubectl exec -it <pod-name> -n <namespace> -- /bin/sh

# Obtener información sobre los servicios
kubectl get services

# Escalar un deployment a un número específico de réplicas
kubectl scale deployment <deployment-name> --replicas=<replica-count> -n <namespace>

# Actualizar una imagen en un deployment
kubectl set image deployment/<deployment-name> <container-name>=<new-image> -n <namespace>

# Crear un objeto a partir de un archivo YAML
kubectl apply -f <filename.yaml>

# Eliminar un objeto por nombre y tipo
kubectl delete <object-type> <object-name> -n <namespace>

# Exponer un deployment como un servicio
kubectl expose deployment <deployment-name> --port=<port> --target-port=<target-port> -n <namespace>

# Acceder al servicio a través del proxy de kubectl
kubectl proxy
