{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Core Kubernetes tools
    kubectl                   # Kubernetes command-line tool
    kubernetes-helm           # Helm package manager for Kubernetes
    
    # Cluster management
    k9s                       # Terminal UI for interacting with Kubernetes clusters
    kubectx                   # Tool to switch between kubectl contexts
    kubens                    # Tool to switch between Kubernetes namespaces
    
    # Development and debugging
    stern                     # Multi-pod and container log tailing
    kustomize                 # Kubernetes native configuration management
    skaffold                  # Tool for continuous development on Kubernetes
    
    # Infrastructure as Code
    terraform                # Infrastructure as Code tool
    terragrunt               # Thin wrapper for Terraform
  ];

  home.shellAliases = {
    # kubectl shortcuts
    k = "kubectl";
    kgp = "kubectl get pods";
    kgs = "kubectl get svc";
    kgd = "kubectl get deployment";
    kgn = "kubectl get nodes";
    kdp = "kubectl describe pod";
    kds = "kubectl describe svc";
    kdd = "kubectl describe deployment";
    kdn = "kubectl describe node";
    kaf = "kubectl apply -f";
    kdf = "kubectl delete -f";
    
    # kubectl with output formatting
    kgpy = "kubectl get pods -o yaml";
    kgpw = "kubectl get pods -o wide";
    
    # kubectl logs
    kl = "kubectl logs";
    klf = "kubectl logs -f";
    
    # kubectl exec
    kex = "kubectl exec -it";
    
    # Context and namespace switching
    kctx = "kubectx";
    kns = "kubens";
    
    # Helm shortcuts
    h = "helm";
    hls = "helm list";
    hi = "helm install";
    hu = "helm upgrade";
    hd = "helm delete";
    hs = "helm status";
    
    # Terraform shortcuts
    tf = "terraform";
    tfi = "terraform init";
    tfp = "terraform plan";
    tfa = "terraform apply";
    tfd = "terraform destroy";
    tfs = "terraform state";
    
    # Terragrunt shortcuts
    tg = "terragrunt";
    tgi = "terragrunt init";
    tgp = "terragrunt plan";
    tga = "terragrunt apply";
    tgd = "terragrunt destroy";
  };

  # Kubernetes-specific environment variables
  home.sessionVariables = {
    # Kubectl configuration
    KUBECONFIG = "${config.home.homeDirectory}/.kube/config";
    
    # Helm configuration
    HELM_CACHE_HOME = "${config.xdg.cacheHome}/helm";
    HELM_CONFIG_HOME = "${config.xdg.configHome}/helm";
    HELM_DATA_HOME = "${config.xdg.dataHome}/helm";
    
    # Terraform configuration
    TF_CLI_CONFIG_FILE = "${config.xdg.configHome}/terraform/terraformrc";
  };

  # Kubernetes configuration directory
  home.file = {
    ".kube/.keep".text = "";
  };
}