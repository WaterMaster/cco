<%@ page import="com.buaa.mooc.entity.Course" %>
<%@ page import="com.buaa.mooc.entity.Homework" %><%--
  Created by IntelliJ IDEA.
  User: windrises
  Date: 2017/7/3
  Time: 0:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

    <meta charset="utf-8" />

    <title>作业提交信息</title>

    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <meta content="" name="description" />

    <meta content="" name="author" />

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

    <link rel="shortcut icon" href="media/image/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="media/css/bootstrap-fileupload.css" />

    <link rel="stylesheet" type="text/css" href="media/css/jquery.gritter.css" />

    <link rel="stylesheet" type="text/css" href="media/css/chosen.css" />

    <link rel="stylesheet" type="text/css" href="media/css/select2_metro.css" />

    <link rel="stylesheet" type="text/css" href="media/css/jquery.tagsinput.css" />

    <link rel="stylesheet" type="text/css" href="media/css/clockface.css" />

    <link rel="stylesheet" type="text/css" href="media/css/bootstrap-wysihtml5.css" />

    <link rel="stylesheet" type="text/css" href="media/css/datepicker.css" />

    <link rel="stylesheet" type="text/css" href="media/css/timepicker.css" />

    <link rel="stylesheet" type="text/css" href="media/css/colorpicker.css" />

    <link rel="stylesheet" type="text/css" href="media/css/bootstrap-toggle-buttons.css" />

    <link rel="stylesheet" type="text/css" href="media/css/daterangepicker.css" />

    <link rel="stylesheet" type="text/css" href="media/css/datetimepicker.css" />

    <link rel="stylesheet" type="text/css" href="media/css/multi-select-metro.css" />

    <link href="media/css/bootstrap-modal.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="media/css/DT_bootstrap.css" />

    <link href="media/css/jquery.fancybox.css" rel="stylesheet" />

    <link href="media/css/jquery.fileupload-ui.css" rel="stylesheet" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">

<!-- BEGIN HEADER -->

<body class="page-header-fixed">

<jsp:include page="student_header.jsp"/>

<!-- END HEADER -->

<!-- BEGIN CONTAINER -->

<div class="page-container row-fluid">

    <!-- BEGIN SIDEBAR -->
    <jsp:include page="student_sidebar.jsp"/>

    <% Course course = (Course) request.getAttribute("course"); %>

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

                        作业管理 <small>学生提交课程作业</small>

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

                            <!-- 数据库获取该课程名 -->

                            <i class="icon-angle-right"></i>

                        </li>

                        <li>

                            <a href="StudentHomework?cid=<%=course.getCid()%>">作业管理</a>

                            <i class="icon-angle-right"></i>

                        </li>

                        <li><a href="#">作业上传</a></li>

                    </ul>

                    <!-- END PAGE TITLE & BREADCRUMB-->

                </div>

            </div>

            <!-- END PAGE HEADER-->

            <!-- BEGIN PAGE CONTENT-->

            <div class="tab-pane " id="tab_3">

                <div class="portlet box green">

                    <div class="portlet-title">

                        <div class="caption"><i class="icon-reorder"></i>作业详情</div>

                    </div>

                    <div class="portlet-body form">
                        <%  Homework homework = (Homework) request.getAttribute("homework");
                            String submitContent = (String) request.getAttribute("submitContent");
                            String status = (String) request.getAttribute("status");
                        %>

                        <!-- BEGIN FORM-->
                        <form action="StudentHomeworkView?cid=<%=homework.getCourseId()%>&hid=<%=homework.getId()%>"
                              method="post" enctype="multipart/form-data">

                        <div class="form-horizontal form-view">

                            <h3><%=homework.getHomeworkName()%>
                            </h3>

                            <h3 class="form-section"></h3>

                            <div class="row-fluid">

                                <div class="span12 ">

                                    <div class="control-group">

                                        <label class="control-label" style=" font-weight:bolder">截止</label>

                                        <div class="controls">

                                            <span class="text"><%=homework.getDeadLine().toLocalDateTime().toString()%></span>

                                        </div>

                                    </div>

                                </div>

                                <!--/span-->

                            </div>

                            <!--/row-->

                            <div class="row-fluid">

                                <div class="span12 ">

                                    <div class="control-group">

                                        <label class="control-label" style=" font-weight:bolder">状态</label>

                                        <div class="controls">

                                            <span class="text"><%=status%></span>

                                        </div>

                                    </div>

                                </div>

                                <!--/span-->

                            </div>

                            <div class="row-fluid">

                                <div class="span12 ">

                                    <div class="control-group">

                                        <label class="control-label" style=" font-weight:bolder">详情</label>

                                        <div class="controls">

                                            <span class="text"><%=homework.getHomeworkInformation()%></span>

                                        </div>

                                    </div>

                                </div>

                                <!--/span-->

                            </div>

                            <h3 class="form-section"></h3>

                            <div class="row-fluid">

                                <div class="span12 ">

                                    <div class="control-group">

                                        <label class="control-label" style=" font-weight:bolder">提交详情</label>

                                        <div class="controls">

                                            <span class="text" ><%=(String)request.getAttribute("submitStatus")%></span>

                                        </div>

                                    </div>

                                    <div class="control-group">

                                        <label class="control-label" style=" font-weight:bolder">作业</label>

                                        <div class="controls">

                                            <textarea class="span12 wysihtml5 m-wrap" readonly type="text" rows="6" name="studentHWText"><%=submitContent%>
                                            </textarea>

                                        </div>

                                    </div>

                                    <div class="control-group">

                                        <label class="control-label" style=" font-weight:bolder">附件:</label>

                                        <div class="controls">

                                            <a href="DownloadFile?fid=<%=request.getAttribute("fid")%>">
                                                <label class="control-label" style=" font-weight:bolder">
                                                <%=(String)request.getAttribute("fname")%>
                                            </label></a>

                                        </div>

                                    </div>


                                </div>

                                <div class="control-group">

                                    <label class="control-label" style=" font-weight:bolder">评语</label>

                                    <div class="controls">

                                        <textarea class="span12 wysihtml5 m-wrap" readonly type="text" rows="6"><%=(String)request.getAttribute("comment")%>
                                        </textarea>

                                    </div>

                                </div>

                                <!--/span-->

                            </div>

                            <div style="margin:20px"></div>
                            <!--/row-->

                            <!--/span-->

                        </div>

                        <!--/row-->

                        <div class="form-actions">

                            <a href="StudentHomework?cid=<%=course.getCid()%>">
                                <button type="button" class="btn">返回</button>
                            </a>

                        </div>

                    </div>

                    <!-- END FORM-->

                </div>

            </div>

        </div>

        <!-- END PAGE CONTAINER-->

    </div>

    <!-- END PAGE -->

</div>

<!-- END CONTAINER -->

<!-- BEGIN FOOTER -->

<div class="footer">

    <div class="footer-inner">

        2017 BuaaSoftware Best Group GAD

    </div>

    <div class="footer-tools">

			<span class="go-top">

			<i class="icon-angle-up"></i>

			</span>

    </div>

</div>

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

<script src="media/js/jquery.uniform.min.js" type="text/javascript" ></script>

<!-- END CORE PLUGINS -->

<script src="media/js/app.js"></script>

<script src="media/js/ckeditor/ckeditor.js"></script>

<script> CKEDITOR.replace('studentHWText');</script>

<script>

    jQuery(document).ready(function() {

        // initiate layout and plugins

        App.init();

    });

</script>

<!-- END JAVASCRIPTS -->

</body>

<!-- END BODY -->

</html>
