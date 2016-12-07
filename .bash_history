apt-get update && apt-get -yqq upgrade

vim /etc/ssh/sshd_config
service ssh restart

apt-get install -yqq vim byobu python-pip git

pip install -U pip && pip install shadowsocks
echo '{
   "server":"0.0.0.0",
   "server_port":64,
   "password":"yourpassword",
    "timeout":300,
   "method":"aes-256-cfb",
   "fast_open": false
}' > /etc/shadowsocks.json && ssserver -c /etc/shadowsocks.json

apt-get -y install build-essential git gcc g++ make && mkdir wen.lu && cd wen.lu && git clone https://github.com/cuber/ngx_http_google_filter_module && git clone https://github.com/yaoweibin/ngx_http_substitutions_filter_module && wget "http://nginx.org/download/nginx-1.10.2.tar.gz" && tar xzvf nginx-1.10.2.tar.gz && wget "ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.39.tar.gz" && tar xzvf pcre-8.39.tar.gz && wget "http://zlib.net/zlib-1.2.8.tar.gz" && tar xzvf zlib-1.2.8.tar.gz &&  wget "https://www.openssl.org/source/openssl-1.1.0c.tar.gz" && tar xzvf openssl-1.1.0c.tar.gz && cd nginx-1.10.2
./configure .--prefix=/opt/nginx-1.10.2 .--with-pcre=../pcre-8.39 .--with-openssl=../openssl-1.1.0c .--with-zlib=../zlib-1.2.8 .--with-http_ssl_module .--add-module=../ngx_http_google_filter_module .--add-module=../ngx_http_substitutions_filter_module && make
make install
/opt/nginx-1.10.2/sbin/nginx 

wget "https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz" && tar -C /usr/local -xzf go1.7.4.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin && go

mkdir /opt/goproxy
cd /opt/goproxy
wget https://github.com/phuslu/goproxy/releases/download/goproxy/goproxy-vps_linux_amd64-r85.tar.xz
tar -xf goproxy-vps_linux_amd64-r85.tar.xz
/opt/goproxy/goproxy-vps -addr 0.0.0.0:451

git clone git@github.com:mhohai/xxx.git
cd /opt/gshmu/xxx
pip install -U -r r.txt
cd /opt/gshmu/xxx/ && gunicorn --pid /tmp/gunicorn.pid --bind 127.0.0.1:9002 --pythonpath /usr/bin/python3 --reload xxx.wsgi

netstat -lntp
