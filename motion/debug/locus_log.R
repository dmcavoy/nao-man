# R file to read in a debug walking output and generate pdf reports
# Instructions: Install the R language (package 'r-base' in debian)
#               run 'make' in the terminal
# Author: Johannes Strom
# Date: Decemeber 2008



foot_locus = function(foot){
dat = read.table(paste("/tmp/",foot,"_locus_log.xls",sep=""),header=T)

name = paste(foot,"_locus_log",sep="")
PDF = ".pdf"

pdf(paste(name,"-x",PDF,sep=""))
plot(dat$time,dat$goal_x,pch="",main=paste(foot,"leg"),xlab="s",ylab="mm")
names = c("goal_x")
cols = c("2")
points(dat$time,dat$goal_x,type="l",col=2)
legend("top",lwd=2,legend=names,col=cols)
zeros = dat$time
zeros[zeros > -100] =  mean(dat$goal_x) +10
points(dat$time,zeros,pch=1,col=dat$state+2)
names = c("Supporting","Swinging","Dbl Sup", "P. Dbl Sup")
legend("topleft",lwd=2,legend=names,col=c(2:5))
dev.off()

pdf(paste(name,"-y",PDF,sep=""))
plot(dat$time,dat$goal_y,pch="",main=paste(foot,"leg"),xlab="s",ylab="mm")
names = c("goal_y")
cols = c("2")
points(dat$time,dat$goal_y,type="l",col=2)
legend("top",lwd=2,legend=names,col=cols)
zeros = dat$time
zeros[zeros > -100] =  mean(dat$goal_y) +10
points(dat$time,zeros,pch=1,col=dat$state+2)
names = c("Supporting","Swinging","Dbl Sup", "P. Dbl Sup")
legend("topleft",lwd=2,legend=names,col=c(2:5))
dev.off()

pdf(paste(name,"-z",PDF,sep=""))
plot(dat$time,dat$goal_z,pch="",main=paste(foot,"leg"),xlab="s",ylab="mm")
names = c("goal_z")
cols = c("2")
points(dat$time,dat$goal_z,type="l",col=2)
legend("top",lwd=2,legend=names,col=cols)
zeros = dat$time
zeros[zeros > -100] = mean(dat$goal_z) +5
points(dat$time,zeros,pch=1,col=dat$state+2)
points(dat$time,pch=1,col=dat$state+2)
names = c("Supporting","Swinging","Dbl Sup", "P. Dbl Sup")
legend("topleft",lwd=2,legend=names,col=c(2:5))
dev.off()
}


foot_locus("left")
foot_locus("right")