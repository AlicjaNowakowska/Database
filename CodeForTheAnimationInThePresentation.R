library("gganimate")
library(ggplot2)
library(gapminder)
library("gifski")
library("png")
library("ggrepel")
library("dplyr")
library("mapdata")
library(transformr)
library(tweenr)

data1=data.frame(quest=c("2016","2016","2017","2017","2018","2018","2019","2019"),resp=c(0,0,0,0,0,0,0,0),
gr=c("prawid這wa odp","udzieli這 prawid這wej odp","prawid這wa odp",
"udzieli這 prawid這wej odp","prawid這wa odp","udzieli這 prawid這wej odp","prawid這wa odp",
"udzieli這 prawid這wej odp"),frame=rep("a",8))
data2=data.frame(quest=c("2016","2016","2017","2017","2018","2018","2019","2019"),
resp=c(308021, 339877,306405, 490138,311641, 483823,304362, 144883),gr=c("prawid這wa odp","udzieli這 prawid這wej odp","prawid這wa odp",
"udzieli這 prawid這wej odp","prawid這wa odp","udzieli這 prawid這wej odp","prawid這wa odp",
"udzieli這 prawid這wej odp"),frame=rep("b",8))
data=rbind(data1,data2)

ts <- list(data1, data2, data1)
tf <- tween_states(ts, tweenlength = 0.02, statelength = 0.001, ease = c('cubic-in-out'), nframes = 30)
tf=tf[1:120,]

p=ggplot(tf, aes(x=gr,y=resp, fill=factor(gr),group=factor(gr)),xlab="",color=factor(gr)) + 
geom_bar(stat = "Identity",position="Identity")+ ggtitle("Bilans finansowy latami")+
transition_reveal(resp)+  
ease_aes('linear')+
facet_wrap(~quest,drop=FALSE)+
scale_fill_manual(values=c("lightgreen", "pink"),labels=c("wp豉ta","wyp豉ta"))+
xlab(element_blank())+
ylab("Kwota")+theme_grey(base_size = 28)+
theme(legend.position="top",legend.title=element_blank(), 
axis.text.x=element_blank())

animate(p, fps =4, renderer = gifski_renderer(loop = F),duration = 15, width = 800, height = 600)

