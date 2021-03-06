<%@ page import="com.buaa.mooc.entity.Course" %>
<%@ page import="com.buaa.mooc.dao.FileDao" %>
<%@ page import="com.buaa.mooc.entity.File" %><%--
  Created by IntelliJ IDEA.
  User: windrises
  Date: 2017/6/30
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!-->
<html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

    <meta charset="utf-8"/>

    <title>source</title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>

    <meta content="" name="description"/>

    <meta content="" name="author"/>

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

    <link rel="stylesheet" href="media/css/DT_bootstrap.css"/>

    <link href="media/css/jquery.fancybox.css" rel="stylesheet"/>

    <link href="media/css/jquery.fileupload-ui.css" rel="stylesheet"/>

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
    <% Course course = (Course) request.getAttribute("course"); %>

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

                        资源管理

                    </h3>

                    <ul class="breadcrumb">

                        <li>

                            <i class="icon-home"></i>

                            <a href="student">主页</a>

                            <i class="icon-angle-right"></i>

                        </li>

                        <li>

                            <a href="StudentCourse?cid=<%=course.getCid()%>"><%=course.getCname()%>
                            </a>

                            <i class="icon-angle-right"></i>

                        </li>

                        <li>

                            <a href="StudentResources?cid=<%=course.getCid()%>">资源管理</a>

                        </li>


                    </ul>

                    <!-- END PAGE TITLE & BREADCRUMB-->

                </div>

            </div>

            <!-- END PAGE HEADER-->

            <!-- BEGIN PAGE CONTENT-->
            <div class="row-fluid">

                <div class="span12">

                    <!-- BEGIN EXAMPLE TABLE PORTLET-->

                    <div class="portlet box purple">

                        <div class="portlet-title">

                            <div class="caption"><i class="icon-edit"></i>资源列表</div>

                        </div>

                        <div class="portlet-body">
                            <div style="padding:15px"></div>
                            <table class="table table-striped table-hover table-bordered" id="sample_editable_1">

                                <thead>

                                <tr>

                                    <th>名称</th>

                                    <th>课程</th>

                                    <th>操作</th>

                                </tr>

                                </thead>

                                <tbody>
                                <%  FileDao fileDao = new FileDao();
                                    Integer fid = course.getFid();
                                    Boolean flag = true;
                                    String name = null;
                                    if(fid == null){
                                        flag = false;
                                    }
                                    else {
                                        File file = fileDao.getFileById(fid);
                                        String fileName = file.getFilename();
                                        if (fileName.endsWith("\\") || fileName.equals("")) {
                                            flag = false;
                                        }
                                        else{
                                            name = fileName.substring(fileName.lastIndexOf("\\") + 1);
                                        }
                                    }
                                    if(flag){
                                %>
                                    <tr class="">

                                        <td><%=name%></td>

                                        <td><%=course.getCname()%></td>

                                        <td>
                                            <a href="DownloadFile?fid=<%=course.getFid()%>" class="btn mini green"><i class="icon-download"></i>下载</a>
                                        </td>

                                    </tr>
                                <%
                                    }
                                    else{
                                %>
                                    <tr class="">

                                        <td>没有课程资源</td>

                                        <td></td>

                                        <td></td>

                                    </tr>
                                <%
                                    }
                                %>

                                </tbody>

                            </table>

                        </div>

                    </div>

                    <!-- END EXAMPLE TABLE PORTLET-->

                </div>

            </div>
            <!-- END SAMPLE TABLE PORTLET-->

        </div>
    </div>

    <!-- END PAGE CONTENT-->

</div>

<!-- END PAGE CONTAINER-->

</div>

<!-- END PAGE -->

</div>

<!-- END CONTAINER -->

<!-- BEGIN FOOTER -->

<jsp:include page="footer.jsp"></jsp:include>

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

</body>

<!-- END BODY -->

</html>
