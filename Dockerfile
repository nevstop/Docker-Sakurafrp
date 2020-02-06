#--注释--
#| Docker 使用#开头作为注释，除非命令行是一个合法的解析器指令(parser directive)
#| 多行连续字符在注释里是不被支持

#--ARG 指令--
ARG alpine_version=3.7

#--FROM 指令--
FROM alpine:${alpine_version}

#--LABEL 指令--
LABEL AUTHOR=yao Orgnization=NEVSTOP
LABEL version="0.3"
LABEL SakuraFrp_APP="frpc_linux_amd64"
LABEL SakuraFrp_Service_Version="2.0"
LABEL description="This is a Frp Service Provide by https://www.natfrp.com/"
LABEL ServiceHostWebsite="https://www.natfrp.com/"
LABEL ServiceDate="2020.2.6"

#--ENV 指令--
# Host SecurityKey
ENV SECURITYKEY=8cbc6f7363529215
# Host ID Provided By SakuraFrp
#   ID    | 名称          | 状态          | 介绍
#  ======================================================================================================
#   1     | 镇江电信      | √ 在线        | 镇江电信高防 100M 
#   2     | 宿迁移动      | √ 在线        | 宿迁移动高防 200M 
#   3     | 枣庄多线      | √ 在线        | 北方联通移动推荐使用 150M 
#   5     | 香港DMIT      | √ 在线        | 香港DMIT 可建站 100M 
#   6     | 镇江电信2     | √ 在线        | 镇江电信高防 100M 
#   7     | 美国洛杉矶    | √ 在线        | 美国洛杉矶 可建站 100M 
#   9     | 福州电信      | √ 在线        | 福州电信高防 100M 
#   10    | 日本东京      | √ 在线        | 日本东京 可建站 1Gbps 
#   11    | 香港CTG       | √ 在线        | 国际宽带 国内访问质量不佳 可建站 
#   12    | 俄勒冈AWS     | √ 在线        | 俄勒冈AWS 可建站 100M 
#   13    | 香港Gigs      | √ 在线        | PCCW线路 可建站 200M 
#   14    | 香港CMI       | √ 在线        | 香港CMI 可建站 100M 
#   15    | 徐州多线      | √ 在线        | 徐州多线BGP 100M 
#   16    | 镇江双线      | √ 在线        | 镇江双线高防 100M 
#   17    | 镇江联通      | √ 在线        | 镇江联通单线 100M 
#   18    | 镇江电信3     | √ 在线        | 镇江电信 100M 
#   19    | 香港CN2       | √ 在线        | 禁止大流量如MC 可建站 
#   20    | 河南联通      | √ 在线        | 河南三门峡联通 
#   21    | 香港阿里云轻量| √ 在线        | 只能建站 禁止违法和擦边球 禁止大流量 
#   22    | 日本东京CN2   | √ 在线        | 可建站 禁止大流量内容 
ENV HOSTID=14

#--VOLUME 指令--
# 使用参数传递，无需使用VOLUME 指令

#--WORKDIR 指令--
WORKDIR /etc/sakurafrp

#--ADD 指令/COPY 指令--
COPY ./FILE/frpc_linux_amd64 /etc/sakurafrp/

#--RUN 指令--
RUN chmod +x frpc_linux_amd64

#--EXPOSE 指令--
# 由于是内网穿透，需要使用HOST NETWORK，所以无需使用EXPOSE指令。

#-------------------------------------------
# ./frpc_linux_amd64 -t 访问密钥 -s 服务器ID
#-------------------------------------------
#--CMD 指令--
CMD ./frpc_linux_amd64 -t ${SECURITYKEY} -s ${HOSTID}

