from django.shortcuts import render, HttpResponse, redirect


def index(request):
    return HttpResponse("欢迎使用Django")


def user_list(request):
    # 1.优先去项目根目录的templates中寻找
    # 2.根据app的注册顺序，在每个app下的templates目录中寻找
    return render(request, "user_list.html")


def user_add(request):
    return render(request, "user_add.html")


def tpl(request):
    name = "蔡徐坤11"
    roles = ['管理员', 'CEO', '保安']
    user_info = {"name": "武松", "salary": 100000, "role": "CTO"}

    data_list = [
        {"name": "武松", "salary": 100000, "role": "CTO"},
        {"name": "马上飞", "salary": 9000, "role": "保安"},
        {"name": "李鹏", "salary": 10000, "role": "管理员"}
    ]

    return render(
        request,
        'tpl.html',
        {"n1": name, "n2": roles, "n3": user_info, "n4": data_list}
    )


def news(req):
    # 定义一些新闻（字典或列表）或去数据库 网络请求去联通新闻
    # 向地址: http://www.chinaunicom.com.cn/api/article/NewsByIndex/2/2021/11/news发送请求
    # 第三方模块：requests（pip install requests）
    import requests
    res = requests.get("http://www.chinaunicom.com.cn/api/article/NewsByIndex/2/2021/11/news")
    data_list = res.content.decode("UTF-8")
    print(data_list)

    return render(req, 'news.html')


def something(request):
    # request是一个对象，封装了用户通过浏览器发送过来的所有请求相关的数据
    # 1.获取请求方式
    print("获取请求方式：", request.method)

    # 2.在URL上传递值 /something/?name=zhangsan&age=13获取请求参数
    print("获取请求参数：", request.GET)

    # 3.在请求体中提交数据
    print(request.POST)

    # 4.【响应】HttpResponse("返回内容") 内容字符串内容返回给请求者
    # return HttpResponse("返回内容")

    # 5.【响应】读取HTML的内容 + 渲染（替换）-> 字符串，返回给用户浏览器
    # return render(request, 'something.html', {"title": "来了"})

    # 6.【响应】让浏览器重定向到其他的页面
    return redirect("https://www.baidu.com")


def login(request):
    if request.method == "GET":
        return render(request, "login.html")
    else:
        # post请求获取用户提交的数据
        # print(request.POST)
        username = request.POST.get("user")
        password = request.POST.get("pwd")
        if username == "root" and password == "123":
            return redirect("http://www.baidu.com")
        else:
            return render(request, "login.html", {"error_msg": "用户名或密码错误"})


def orm(request):
    # 测试ORM操作表中的数据

    # ############ 1.新建 ############
    # Department.objects.create(title="销售部")
    # Department.objects.create(title="IT部")
    # Department.objects.create(title="运营部")

    # UserInfo.objects.create(name="小明", password="123", age=20)
    # UserInfo.objects.create(name="鹿紫云", password="666", age=25)
    # UserInfo.objects.create(name="鹿紫云", password="666")

    # ############ 2.删除 ############
    # UserInfo.objects.filter(id=3).delete()
    # Department.objects.all().delete()

    # ############ 3.获取数据 ############
    # 3.1 获取符合条件的所有数据
    # data_list = [行(对象), 行(对象), 行(对象)] QuerySet类型
    # data_list = UserInfo.objects.all()
    # for obj in data_list:
    #     print(obj.id, obj.name, obj.password, obj.age)

    # data_list = [行(对象),]
    # data_list = UserInfo.objects.filter(id=1)
    # print(data_list)

    # 3.1 获取（查询）第一条数据【对象】
    # row_obj = UserInfo.objects.filter(id=1).first()
    # print(row_obj.id, row_obj.name, row_obj.password, row_obj.age)

    # ############ 4.更新数据 ############
    # UserInfo.objects.all().update(password=123456)          # 全部
    # UserInfo.objects.filter(id=2).update(password=123456)   # 按条件

    return HttpResponse("成功")


from app01.models import Department, UserInfo


def info_list(request):
    # 1.获取数据库中所有的用户信息
    data_list = UserInfo.objects.all()
    print(data_list)

    return render(request, "info_list.html", {"data_list": data_list})


def info_add(request):
    if request.method == "GET":
        return render(request, "info_add.html")

    # 获取用户提交的数据
    user = request.POST.get("user")
    pwd = request.POST.get("pwd")
    age = request.POST.get("age")

    # 添加到数据库
    UserInfo.objects.create(name=user, password=pwd, age=age)

    return redirect("/info/list/")


def info_delete(request):
    nid = request.GET.get('nid')
    UserInfo.objects.filter(id=nid).delete()
    return redirect("/info/list/")




