print("Hello world")
help(print)
x1<- c(10,20,30)
x1
x2 <- c(10:15)
x2
x3 <- seq(10,15)
x3
x4<- seq(1,10,by=4)
x4
ex_vector <- c(-1,0,1)
ex_vector
str(ex_vector)
length(ex_vector)
ex_vector2 <- c("Hello","HI~")
ex_vector2
ex_vector3 <- c("1","2","3")
ex_vector3
str(ex_vector2)
str(ex_vector3)
ex_vector4 <- c(TRUE,FALSE,TRUE,FALSE)
ex_vector4
str(ex_vector4)
remove(ex_vector4)
ex_vector4
rm(ex_vector3)
ex_vector3
clear
x <- c(1,2,3,4,5,6)
matrix(x,nrow =2, ncol = 3)
matrix(x,nrow=3,ncol=2)

x<- c(1,2,3,4,5,6)
matrix(x, nrow=2, ncol=3)
matrix(x,nrow=2,ncol=3,byrow=T)

y <- c(1,2,3,4,5,6)
array(y,dim=c(2,3,2))

list1 <- list(c(1,2,3), "Hello")
list1
str(list1)
ID <- c(1,2,3,4,5,6,7,8,9,10)
SEX <- c("F","M","F","M","M","F","F","F","M","F")
AGE <- c(50,40,28,50,27,23,56,47,20,38)
AREA <- c("서울","경기","제주","서울","서울","서울","경기","서울","인천","경기")
dataframe_ex <- data.frame(ID, SEX, AGE, AREA)
dataframe_ex
str(data.frame)
str(dataframe_ex)
t(dataframe_ex)
x <- 10
x1 <- c(10,20,30)
y <- "HI"
y1<-c("Hello","Hi","Hello~!")
-+
ID <- c(1,2,3,4,5)
MID_EXAM <- c(10,25,100,75,30)
CLASS <-c("1반","2반","3반","1반","2반")
example_test <- data.frame(ID,MID_EXAM,CLASS)
example_test
t(example_test)
ID <- c(1,2,3,4,5)
ID
SEX <- c("F","M","F","M","F")
SEX
DATA <- data.frame(ID=ID,SEX=SEX)
View(t(DATA))
library(readxl)
install.packages("xlsx")
library(xlsx)
excel_data_ex <- read_xlsx("woori.xlsx")
View(excel_data_ex)
ex_data <- read.table("data_ex.txt")
ex_data
t(ex_data)
View(ex_data)
ex_data <- read.table("data_ex.txt", header = TRUE)
View(ex_data)
ex_data1 <- read.table("data_ex.txt", header=TRUE)
ex_data <- read.table("data_ex.txt",header=TRUE)
View(ex_data)
ex_data1 <- read.table("data_ex.txt", header=TRUE)
View(ex_data1)
ex_data2 <- read.table("data_ex.txt", header=FALSE, skip=2)
View(ex_data2)
ex_data3 <- read.table("data_ex.txt", header=TRUE, nrows =7, ncols= 2)
View(ex_data3)
ex1_data <- read.table("data_ex.txt", header = TRUE, sep = ",")
View(ex1_data)
varname <- c("ID","SEX","AGE","AREA")
ex2_data <- read.table("data_ex2.txt", sep = ",", col.names = varname)
View(ex2_data)
data_ex <- read.delim("data_ex.txt")
View(data_ex)
library(readxl)
# data excel 불러오기 header에 varname넣어서 출력
varname <- c("ID","SEX","AGE","AREA")
data_ex <- read_excel("data_ex.txt", col_names = varname)
View(data_ex)
# excel sheet1을  읽어오기
library(readxl)
data_ex <- read_excel("data_ex.txt", sheet = "sheet1")
View(data_ex)
# data저장하기 (R전용파일.rda) : save(data, file= 파일이름)형식 사용
ID <- c(1,2,3,4,5)
SEX <- c("F","M","F","M","F")
data_ex <- data.frame(ID=ID , SEX=SEX)
save(data_ex, file="data_ex.rda")

# rda파일불러오기
load("data_ex.rad")
View(data_ex)
head(data_ex,2)

#CSV file형식으로저장하기(txt file 형식으로도 저장가능) : write.csv 사용 엑셀에서확인가능
ID <- c(1,2,3,4,5)
SEX <- c("F","M","F","M","F")
data_ex <- data.frame(ID = ID , SEX = SEX)
write.csv(data_ex,file= "data_ex.csv")

load("data_ex.csv")
#TXT file 형식으로저장하기 - 텍스트파일에서확인가능하다 여기서 볼 수  없다
ID <- c(1,2,3,4,5)
SEX <- c("F","M","F","M","F")
data_ex <- data.frame(ID = ID , SEX = SEX)
write.table(data_ex, file="data_ex.txt", quote=FALSE)




