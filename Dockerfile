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
LABEL description="This is a Frp Service Provide by https://www.natfrp.com/"
LABEL ServiceHostWebsite="https://www.natfrp.com/"
LABEL SakuraFrp_APP="frpc_linux_amd64"
LABEL SakuraFrp_Service_Version="2.0"
LABEL SakuraFrp_SECURITYKEY="注册后，从网页端获取"
LABEL SakuraFrp_HostID_1  ="镇江电信      | 镇江电信高防 100M "
LABEL SakuraFrp_HostID_2  ="宿迁移动      | 宿迁移动高防 200M "
LABEL SakuraFrp_HostID_3  ="枣庄多线      | 北方联通移动推荐使用 150M "
LABEL SakuraFrp_HostID_5  ="香港DMIT      | 香港DMIT 可建站 100M "
LABEL SakuraFrp_HostID_6  ="镇江电信2     | 镇江电信高防 100M "
LABEL SakuraFrp_HostID_7  ="美国洛杉矶    | 美国洛杉矶 可建站 100M "
LABEL SakuraFrp_HostID_9  ="福州电信      | 福州电信高防 100M "
LABEL SakuraFrp_HostID_10 ="日本东京      | 日本东京 可建站 1Gbps "
LABEL SakuraFrp_HostID_11 ="香港CTG       | 国际宽带 国内访问质量不佳 可建站 "
LABEL SakuraFrp_HostID_12 ="俄勒冈AWS     | 俄勒冈AWS 可建站 100M "
LABEL SakuraFrp_HostID_13 ="香港Gigs      | PCCW线路 可建站 200M "
LABEL SakuraFrp_HostID_14 ="香港CMI       | 香港CMI 可建站 100M "
LABEL SakuraFrp_HostID_15 ="徐州多线      | 徐州多线BGP 100M "
LABEL SakuraFrp_HostID_16 ="镇江双线      | 镇江双线高防 100M "
LABEL SakuraFrp_HostID_17 ="镇江联通      | 镇江联通单线 100M "
LABEL SakuraFrp_HostID_18 ="镇江电信3     | 镇江电信 100M "
LABEL SakuraFrp_HostID_19 ="香港CN2       | 禁止大流量如MC 可建站 "
LABEL SakuraFrp_HostID_20 ="河南联通      | 河南三门峡联通 "
LABEL SakuraFrp_HostID_21 ="香港阿里云轻量| 只能建站 禁止违法和擦边球 禁止大流量 "
LABEL SakuraFrp_HostID_22 ="日本东京CN2   | 可建站 禁止大流量内容 "

#--ENV 指令--
# Host SecurityKey Provided By SakuraFrp
ENV SECURITYKEY=8cbc6f7363529215
# Host ID Provided By SakuraFrp
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

