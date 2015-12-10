vim /etc/ssh/sshd_config
service ssh restart

apt-get update && apt-get upgrade && apt-get -y install python-pip byobu && pip install -U pip && pip install shadowsocks && echo '{
   "server":"0.0.0.0",
   "server_port":64,
   "password":"yourpassword",
    "timeout":300,
   "method":"aes-256-cfb",
   "fast_open": false
}' > /etc/shadowsocks.json && ssserver -c /etc/shadowsocks.json

apt-get -y install build-essential git gcc g++ make && mkdir wen.lu && cd wen.lu && git clone https://github.com/cuber/ngx_http_google_filter_module && git clone https://github.com/yaoweibin/ngx_http_substitutions_filter_module && wget "http://nginx.org/download/nginx-1.8.0.tar.gz" && tar xzvf nginx-1.8.0.tar.gz && wget "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.38.tar.gz" && tar xzvf pcre-8.38.tar.gz && wget "http://zlib.net/zlib-1.2.8.tar.gz" && tar xzvf zlib-1.2.8.tar.gz &&  wget "https://www.openssl.org/source/openssl-1.0.1j.tar.gz" && tar xzvf openssl-1.0.1j.tar.gz && cd nginx-1.8.0 && ./configure 	--prefix=/opt/nginx-1.8.0 	--with-pcre=../pcre-8.38 	--with-openssl=../openssl-1.0.1j 	--with-zlib=../zlib-1.2.8 	--with-http_ssl_module 	--add-module=../ngx_http_google_filter_module 	--add-module=../ngx_http_substitutions_filter_module && make && make install && cp /opt/nginx-1.8.0/conf/nginx.conf{,.default} && echo 'vim /opt/nginx-1.8.0/conf/nginx.conf' || echo 'ERROR: check server version'
/opt/nginx-1.8.0/sbin/nginx 

wget "https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz"
tar -C /usr/local -xzf go1.5.2.linux-amd64.tar.gz 
export PATH=$PATH:/usr/local/go/bin
go

wget "https://github.com/phuslu/goproxy/releases/download/goproxy/govps_linux_amd64-r169.tar.bz2"
tar -vxjf govps_linux_amd64-r169.tar.bz2 && mv opt/govps /opt && rmdir opt/
vim /opt/govps/govps.service 
/opt/govps/govps 

netstat -antp
