FROM amazon/aws-cli:2.1.30

RUN yum install -y curl
RUN yum install -y unzip
RUN yum install -y git
RUN yum install -y openssl
RUN yum install -y tar
RUN yum install -y jq
RUN yum install -y vim

RUN curl -o /tmp/terraform.zip -LO https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip
RUN unzip /tmp/terraform.zip
RUN chmod +x terraform && mv terraform /usr/local/bin/

RUN curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.18.9/2020-11-02/bin/linux/amd64/kubectl
RUN chmod +x kubectl && mv kubectl /usr/local/bin/

RUN curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 > get_helm.sh
RUN chmod 700 get_helm.sh
RUN ./get_helm.sh
RUN rm get_helm.sh

RUN curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
RUN mv /tmp/eksctl /usr/local/bin

# ENTRYPOINT bash