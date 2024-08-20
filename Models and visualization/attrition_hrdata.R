hr_data=data.frame(employee_id=1:10,
                   current_employee=sample(0:1,10,replace=TRUE),
                   performance_rating=sample(1:5,10,replace=TRUE),
                   department=sample(c("Sales","Marketing","IT","HR"),10,replace=TRUE))
hr_data
nrow(hr_data)
ncol(hr_data)

#Calculate ATTRITION RATE
library(dplyr)

#Filter the employees who left the company
emp_left<-filter(hr_data,current_employee==0)
emp_left

#Calculate no of employees left the organization
n_emp_left<-nrow(emp_left)
n_emp_left

#Assume that the no employees who joined in between the year
avg_emp=(nrow(hr_data)+(nrow(hr_data)-n_emp_left))/2
avg_emp

attrition_rate=(n_emp_left/avg_emp)*100
attrition_rate

#Calculate Retention Rate
emp_ret<-filter(hr_data,current_employee==1)
emp_ret

retention_rate=(nrow(emp_ret)/10)*100
retention_rate

#Analyze employee performance
performance_summary<-hr_data%>%group_by(department)%>%
  summarise(avg_performance=mean(performance_rating,na.rm = TRUE),
            max_performance=max(performance_rating,na.rm=TRUE),
            min_performance=min(performance_rating,na.rm=TRUE))
performance_summary

#Visualize plot performance RATINGS by department
library(ggplot2)
pf<-ggplot(data=hr_data,aes(x=performance_rating))+labs(title="performance rating by department")+geom_histogram(fill="skyblue")
pf

#Visualize number of exits by department
exit_dept<-hr_data%>% group_by

