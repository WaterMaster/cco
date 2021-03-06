<%@ page import="com.buaa.mooc.entity.Course" %>
<%@ page import="com.buaa.mooc.entity.Teacher" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

    <meta charset="utf-8"/>

    <title>课程管理</title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <meta content="" name="description"/>

    <meta content="" name="author"/>

    <!-- BEGIN GLOBAL MANDATORY STYLES -->

    <link href="media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

    <link href="media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

    <link href="media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

    <link href="media/css/style-metro.css" rel="stylesheet" type="text/css"/>

    <link href="media/css/style2.css" rel="stylesheet" type="text/css"/>

    <link href="media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

    <link href="media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

    <link href="media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

    <!-- END GLOBAL MANDATORY STYLES -->

    <!-- BEGIN PAGE LEVEL STYLES -->

    <link rel="stylesheet" href="media/css/DT_bootstrap.css"/>

    <!-- END PAGE LEVEL STYLES -->

    <link rel="shortcut icon" href="media/image/favicon.ico"/>

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">

<jsp:include page="student_header.jsp"/>

<!-- BEGIN CONTAINER -->

<div class="page-container row-fluid">

    <jsp:include page="student_sidebar.jsp"/>

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

        <% Course course = (Course) request.getAttribute("course"); %>

        <!-- BEGIN PAGE CONTAINER-->

        <div class="container-fluid">

            <!-- BEGIN PAGE HEADER-->

            <div class="row-fluid">

                <div class="span12">

                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->

                    <h3 class="page-title">

                        课程管理
                        <small> 学生管理课程作业、资源、讨论组</small>

                    </h3>

                    <ul class="breadcrumb">

                        <li>

                            <i class="icon-home"></i>

                            <a href="student">主页</a>

                            <i class="icon-angle-right"></i>

                        </li>

                        <li>

                            <a href="StudentCourse?cid=<%=course.getCid()%>">课程管理</a>

                        </li>

                    </ul>

                    <!-- END PAGE TITLE & BREADCRUMB-->

                </div>

            </div>

            <!-- END PAGE HEADER-->

            <!-- BEGIN PAGE CONTENT-->

            <div class="tiles">

                <div class="tile double bg-blue">

                    <div class="corner"></div>

                    <div class="check"></div>

                    <div class="tile-body">

                        <div style="margin:20px"></div>

                        <h2 style=" font-weight:bolder"><%=course.getCname()%>
                        </h2>

                        <div style="margin:15px"></div>

                        <h4>学分：<%=course.getCredit()%>
                        </h4>

                        <div style="margin:15px"></div>

                        <% List<Teacher> teachers = (List<Teacher>) request.getAttribute("teachers"); %>

                        <h4>
                            任课老师：
                            <%
                                if (teachers != null && teachers.size() > 0) {
                                    for (Teacher teacher : teachers) {
                            %>
                            <%=(teachers.get(0).getTid().equals(teacher.getTid()) ? teacher.getTname() : ", " + teacher.getTname())%>
                            <%
                                    }
                                }
                            %>
                        </h4>

                        <h4>
                            开始日期：
                            <%=
                            course.getBeginDate().toString()%>
                        </h4>

                        <h4>
                            结束日期：
                            <%=course.getEndDate().toString()
                            %>
                        </h4>

                        <h4>
                            上课地点：
                            <%=course.getAddress()%>
                        </h4>

                        <h4>
                            <%=
                            (course.getGroup_mem_max()!=null ? "组队人数上限："+course.getGroup_mem_max() : "") + "\n" +
                            (course.getGroup_mem_min()!=null ? "组队人数下限："+course.getGroup_mem_min() : "")
                            %>
                        </h4>

                    </div>

                </div>

                <a href="StudentHomework?cid=<%=course.getCid()%>">

                    <div class="tile double-down bg-green">

                        <div class="tile-body">

                            <i class="icon-calendar"></i>

                        </div>

                        <div class="tile-object">

                            <div class="name" style="font-size:large">

                                作业

                            </div>

                        </div>

                    </div>
                </a>

                <a href="StudentResources?cid=<%=course.getCid()%>">

                    <div class="tile double-down bg-purple">

                        <div class="tile-body">

                            <i class="icon-paste"></i>

                        </div>

                        <div class="tile-object">

                            <div class="name" style="font-size:large">

                                资源

                            </div>


                        </div>

                    </div>
                </a>

                <a href="StudentGrade?cid=<%=course.getCid()%>">

                    <div class="tile double-down2 bg-yellow">

                        <div class="tile-body">

                            <i class="icon-comments-alt" style=" padding-top:75px"></i>

                        </div>

                        <div class="tile-object">

                            <div class="name" style="font-size:large">

                                成绩

                            </div>

                        </div>

                    </div>
                </a>

                <!-- END PAGE CONTENT-->

            </div>

            <!-- END PAGE CONTAINER-->

        </div>

        <!-- END PAGE -->

    </div>

    <!-- END CONTAINER -->

    <!-- BEGIN FOOTER -->

    <jsp:include page="footer.jsp"/>

    <!-- END FOOTER -->

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

    <script src="media/js/jquery.uniform.min.js" type="text/javascript"></script>

    <!-- END CORE PLUGINS -->

    <script src="media/js/app.js"></script>

    <script>

        jQuery(document).ready(function () {

            // initiate layout and plugins

            App.init();

        });

    </script>

    <!-- END JAVASCRIPTS -->

</body>

<!-- END BODY -->

</html>