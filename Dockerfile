#使用的基础镜像
FROM centos
#安装sshd服务
RUN yum -y install openssh-server
#生成ssh服务端密钥
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
RUN ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key -N ''
#设置用户密码
RUN echo root | passwd --stdin root
#添加三方源 安装python3.4 以及 pip3.4
RUN yum -y install epel-release 
RUN yum -y install python34 python34-pip
#添加启动容器自动开启sshd服务
CMD ["/usr/sbin/sshd", "-D"]
#保存好Dockerfile文件
#构建images步骤
#1.sudo docker build -t cent_ss_test:v1.0 .
#2.sudo docker run -d --rm -p 10000:22 --name test_cent_ss_test  cent_ss_test:v1.0 /usr/sbin/sshd -D
#3.ssh root@localhost -p 10000

