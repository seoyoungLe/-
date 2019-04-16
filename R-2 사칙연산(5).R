# 숫자 데이터분석/기초연산자
##데이터파악함수##
#사칙 연산
20 %% 7

20 %/% 7

6^2

6 ** 2

# 논리 연산자
x <- 1:3 
y <- 3:1
x
y
(x>0)&(y>1) # x는 보다 크고(그리고) y는1보다 크거나 혹은 아니면 FALSE
(x>0) | (y>1) # x는 0보다 크거나(or) y는1보다 크면 TRUE or FALSE

# excel file 불러오기
library(readxl)
#exdata1 <- read_excel("Sample1.xlsx") 원래데이터format
#exdata1 <- read_excel("Sample1.xlsx", skip =2) 위에줄2개 skip해서나옴
#exdata1 <- read_excel("Sample1.xlsx", nrows=7) 엑셀파일에는 header / nrows ncols 는 쓸수없다.
#varname <- c("ID","SEX","AGE","AREA","money","Nu","Dollor","num")
#exdata1 <- read_excel("Sample1.xlsx", col_names = varname) varname으로헤더를변경할수있다.
exdata1 <- read_excel("Sample1.xlsx")
exdata1
View(exdata1)

str(exdata1) # data세트는 데이터형태와 관측치10개 변수8개로 구성 된 것을 알 수 있다.
dim(exdata1)  # lsdata가 10개의행 과 8개의열로 구성 된 것을 알 수 있다.
ls(exdata1)  # ls는 data의 변수명을 확인 할 수 있다.

## 변수명 변경하기 ##
install.packages("dplyr")
library(dplyr)
exdata1 <- rename(exdata1 , Y17_AMT = AMT17 , Y16_AMT = AMT16) #변수명변경
View(exdata1)
rename(exdata1, Y17_AMT=AMT17, Y16_AMT=AMT16)

# 새로운변수생성하기
exdata1$AMT <- exdata1$Y17_AMT + exdata1$Y16_AMT # data에 AMT16/17년도 data를 새로생성한다
exdata1$CNT <- exdata1$Y17_CNT + exdata1$Y16_CNT # data에 CNT16/17년도 data를 새로생성한다
View(exdata1) 

exdata1$AVG <- exdata1$AMT / exdata1$CNT # 2개를 가지고 평균을 내고 col을 추가하였다.
View(exdata1)

exdata1$AGE50_YN <- ifelse(exdata1$AGE >= 50, "Y", "N") # age가50이상인변수골라내기
View(exdata1)

exdata1$AGE_GR10 <- ifelse(exdata1$AGE>=50 , "AI.50++", 
                           ifelse(exdata1$AGE>=40, "AGE 40+",
                                  ifelse(exdata1$AGE>=30, "30+",
                                         ifelse(exdata1$AGE>=20, "20","AGE 0019")))) #변수추가ifelse로추가함/ 괄호())닫는거잘볼것
View(exdata1)                           

##변수추출하기## select / fillter 
# select() 변수col에대한추출
exdata1 %>% select(ID)  # %>%는 dplyr패키지에포함된기능중하나이며"복잡한코드"를한번에처리할수있게도와주는연산자이다.
exdata1 %>% select(ID,AREA,Y17_CNT) # ,를 이용해서 여러변수를 추출 해 낼 수 있다.
exdata1 %>% select(-AREA) # AREA 함수만"제외"하고 추출
exdata1 %>% select(-AREA, -Y17_CNT)

#filter()  data에대한추출
exdata1 %>% filter(AREA == '서울')  # data에서 서울추출
exdata1 %>% filter(AREA == '서울'& Y17_CNT >= 10)

# arrange 오름차순정렬함수 arrange(desc()) 내림차순정렬함수
exdata1 %>% arrange(AGE)
exdata1 %>% arrange(desc(Y17_AMT))
exdata1 %>% arrange(AGE, desc(Y17_AMT)) # age 변수기준으로 age변수값이같은것이 2개이상일경우 Y17_AMT기준으로내림차순한다.
# 여기서내림차순과오름차순이 숫자의순서대로임을알아야한다. 숫자가큰게올림이아니다.

#데이터요약하기 group_by() / summarise()
# summarise ()  Q1 Q2 Q3 1/4값을도출해낸다.
exdata1 %>% summarise(TOT_Y17_AMT = sum(Y17_AMT))  # TOT ~ 변수값에 sum(Y17_AMT값을저장한다.)
exdata1 %>% group_by(AREA) %>% summarise(SUM_Y17_AMT = sum(Y17_AMT)) # AREA 값별로 sum한값을보여준다.

# 데이터결합하기 rbind()  cbind()
m_history <- read_excel("Sample2_m_history.xlsx")
f_history <- read_excel("Sample3_f_history.xlsx")
View(m_history)
View(f_history)

exdata_bindjoin <- rbind(m_history, f_history) # m/f data를 row형태로 bind해줌
View(exdata_bindjoin)

# 가로결합 lef_join()  inner_join(), full_join() 함수
jeju17 <- read_excel("Sample4_y17_history.xlsx")  # 8,6
jeju16 <- read_excel("Sample5_y16_history.xlsx")  # 9,3
View(jeju16)
View(jeju17)

bind_col <- left_join(jeju17, jeju16, by="ID") #left_join은 먼저나온 jeju17을기준으로 순서를 맞추는것
inner <- inner_join(jeju17, jeju16, by="ID")  #inner_join은 앞과뒤의data가세트를 이룰경우에만 출력
full <- full_join(jeju17,jeju16, by="ID") #row col 상관없이 data를 다 출력
View(full)

#결측값제외하고 계산하는법
x1 <- c(1,2,NA,4,5)
x1 
x1 * 10 
is.na(x1)  # x1의변수의결측값조회
table(is.na(x1))  #결측값을table로보여준다.
sum(x1)
sum(x1, na.rm=T)
