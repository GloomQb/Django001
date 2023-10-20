from django.db import models


class UserInfo(models.Model):
    name = models.CharField(max_length=32)
    password = models.CharField(max_length=64)
    age = models.IntegerField(default=12)
    # data = models.IntegerField(null=True, blank=True)


class Department(models.Model):
    title = models.CharField(max_length=15)


# ########### 新增数据 ##########
# insert into app01_department(title)values("销售部")
# Department.objects.create(title="销售部")
# UserInfo.objects.create(name="xiaoming", password="123", age=14)

"""
create table app01_userInfo(
    id bigint auto_increment primary key,
    name varchar(32),
    password varchar(64),
    age int
)
"""











