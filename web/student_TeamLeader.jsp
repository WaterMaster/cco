<%@ page import="java.util.List" %>
<%@ page import="com.buaa.mooc.entity.StudentRecruitView" %>
<%@ page import="com.buaa.mooc.entity.GroupRecruit" %>
<%@ page import="com.buaa.mooc.dao.StudentDao" %>
<%@ page import="com.buaa.mooc.entity.Student" %><%--
  Created by IntelliJ IDEA.
  User: zhwpc
  Date: 2017/7/3
  Time: 17:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
    List<StudentRecruitView> students = (List<StudentRecruitView>) request.getAttribute("students");
    GroupRecruit groupRecruit = (GroupRecruit) request.getAttribute("groupRecruit");
%>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

    <meta charset="utf-8" />

    <title>团队详情</title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <meta content="" name="description" />

    <meta content="" name="author" />

    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <link href="media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <link href="media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

    <link href="media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    <link href="media/css/style-metro.css" rel="stylesheet" type="text/css"/>

    <link href="media/css/style.css" rel="stylesheet" type="text/css"/>

    <link href="media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

    <link href="media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

    <link href="media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL STYLES -->

    <link rel="stylesheet" type="text/css" href="media/css/select2_metro.css" />

    <link rel="stylesheet" href="media/css/DT_bootstrap.css" />

    <!-- END PAGE LEVEL STYLES -->

    <link rel="shortcut icon" href="media/image/favicon.ico" />

    <script language="JavaScript">
        function ApproveorReject(mes, grid, sid) {
            $.ajax({
                type: "POST",
                dataType: "json",
                url: "StudentTeamLeader",
                data: {
                    message: mes,
                    grid: grid,
                    sid: sid
                },
                success: function () {//返回成功后执行的函数，result是返回的数据
                    if (mes == 'y') {
                        $("#"+sid+"d").attr("class", "btn mini black hidden");
                        $("#"+sid+"a").attr("class", "btn mini blue disabled").attr("onClick",  "");
                    }
                    else {
                        $("#"+sid+"a").attr("class", "btn mini blue hidden");
                        $("#"+sid+"d").attr("class", "btn mini black disabled").attr("onClick",  "");
                    }
                }
            });
        }
    </script>

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">

<!-- BEGIN HEADER -->
<jsp:include page="student_header.jsp"/>
<!-- END HEADER -->

<!-- BEGIN CONTAINER -->

<div class="page-container row-fluid">

    <!-- BEGIN SIDEBAR -->
    <jsp:include page="student_sidebar.jsp"/>
    <!-- END SIDEBAR -->

    <!-- BEGIN PAGE -->

    <div class="page-content">

        <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->

        <div id="portlet-config" class="modal hide">

            <div class="modal-header">

                <button data-dismiss="modal" class="close" type="button"></button>

                <h3>portlet Settings</h3>

            </div>

            <div class="modal-body">

                <p>Here will be a configuration form</p>

            </div>

        </div>

        <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->

        <!-- BEGIN PAGE CONTAINER-->

        <div class="container-fluid">

            <!-- BEGIN PAGE HEADER-->

            <div class="row-fluid">

                <div class="span12">

                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->

                    <h3 class="page-title">

                        团队详情 <small>查看组员信息等</small>

                    </h3>

                    <ul class="breadcrumb">

                        <li>

                            <i class="icon-home"></i>

                            <a href="student">主页</a>

                            <i class="icon-angle-right"></i>

                        </li>

                        <li>

                            <i class=""></i>

                            <a href="StudentGroupHome?cid=<%=groupRecruit.getCid()%>">团队管理</a>

                            <i class="icon-angle-right"></i>

                        </li>

                        <li>

                            <i class=""></i>

                            <a href="StudentTeamLeader?grid=<%=groupRecruit.getGrid()%>">团队成员申请</a>

                        </li>

                    </ul>

                    <!-- END PAGE TITLE & BREADCRUMB-->

                </div>

            </div>

            <!-- END PAGE HEADER-->

            <!-- BEGIN PAGE CONTENT-->

            <div class="row-fluid">

                <div class="span12">

                    <!-- BEGIN SAMPLE TABLE PORTLET-->

                    <div class="portlet box blue">

                        <div class="portlet-title">

                            <div class="caption"><i class="icon-cogs"></i>申请列表</div>

                            <div class="actions">


                            </div>


                        </div>

                        <div class="portlet-body flip-scroll">

                            <table class="table-bordered table-striped table-condensed flip-content">

                                <thead class="flip-content">

                                <tr>

                                    <th>学号</th>

                                    <th>姓名</th>

                                    <th class="numeric">性别</th>

                                    <th class="numeric">审核</th>

                                </tr>

                                </thead>

                                <tbody>

                                <%
                                    if (students != null && students.size() > 0) {
                                        for (StudentRecruitView student : students) {
                                            Student stu = new StudentDao().findById(student.getPk().getSid());
                                            if (!student.getConvener().equals(stu.getSid())) {
                                %>
                                <tr>

                                    <td><%=student.getPk().getSid()%></td>

                                    <td><%=stu.getSname()%></td>

                                    <td class="numeric"><%=stu.getSex().equalsIgnoreCase("f") ? "女" : "男"%></td>

                                    <td><div align="center">
                                        <%
                                            Boolean granted = !student.getGranted().equals(0);
                                        %>
                                        <button onClick="<%=granted?"":"ApproveorReject('y', "+ student.getPk().getGrid() + ", " + stu.getSid()+")"%>"
                                                id="<%=stu.getSid()%>a" class="btn mini blue <%=granted?"disabled":""%>" >
                                            <i class="icon-pencil"></i> 同意
                                        </button>
                                        <button onClick="ApproveorReject('n', '<%=student.getPk().getGrid()%>','<%=stu.getSid()%>')"
                                                id="<%=stu.getSid()%>d" class="btn mini black <%=granted?"hidden":""%>">
                                            <i class="icon-trash"></i> 拒绝
                                        </button>
                                    </div>

                                    </td>

                                </tr>
                                <%
                                            }
                                        }
                                    }
                                %>

                                </tbody>

                            </table>

                        </div>

                    </div>

                </div>

                <!-- END SAMPLE TABLE PORTLET-->
                <div align="center">
                    <a class="btn medium blue" href="SubmitGroupRecruit?grid=<%=groupRecruit.getGrid()%>" ><i class="icon-edit"></i> <big>提交申请</big></a>
                </div>

                <!-- END SAMPLE TABLE PORTLET-->
            </div>

        </div>

        <!-- END PAGE CONTENT-->

    </div>

    <!-- END PAGE CONTAINER-->

</div>

<jsp:include page="footer.jsp"/>
<!-- END PAGE -->

<!-- END CONTAINER -->

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

<!-- BEGIN CORE PLUGINS -->

<script src="media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

<script src="media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

<script src="media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>

<script src="media/js/bootstrap.min.js" type="text/javascript"></script>

<!--[if lt IE 9]>

<script src="media/js/excanvas.min.js"></script>

<script src="media/js/respond.min.js"></script>

<![endif]-->

<script src="media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

<script src="media/js/jquery.blockui.min.js" type="text/javascript"></script>

<script src="media/js/jquery.cookie.min.js" type="text/javascript"></script>

<script src="media/js/jquery.uniform.min.js" type="text/javascript" ></script>

<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL PLUGINS -->

<script type="text/javascript" src="media/js/select2.min.js"></script>

<script type="text/javascript" src="media/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" src="media/js/DT_bootstrap.js"></script>

<!-- END PAGE LEVEL PLUGINS -->

<script src="media/js/app.js"></script>

<script src="media/js/table-advanced.js"></script>

<script>

    jQuery(document).ready(function() {

        // initiate layout and plugins

        App.init();

        TableAdvanced.init();

    });

</script>

</body>

<!-- END BODY -->

</html>
