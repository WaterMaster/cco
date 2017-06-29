<%--
  Created by IntelliJ IDEA.
  User: windrises
  Date: 2017/6/29
  Time: 0:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

    <meta charset="utf-8" />

    <title>作业上传</title>

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

<jsp:include page="student_header.jsp"></jsp:include>

<!-- BEGIN CONTAINER -->

<div class="page-container row-fluid">

    <jsp:include page="student_sidebar.jsp"></jsp:include>

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
                            <!--赶时间 写死了 -->
                            <a href="student_course.jsp">敏捷开发</a>

                            <!-- 数据库获取该课程名 -->

                            <i class="icon-angle-right"></i>

                        </li>

                        <li>

                            <a href="studentHomework">作业管理</a>

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

                        <!-- BEGIN FORM-->

                        <div class="form-horizontal form-view">

                            <h3> 软件开发实践: 作业</h3>

                            <h3 class="form-section"></h3>

                            <div class="row-fluid">

                                <div class="span12 ">

                                    <div class="control-group">

                                        <label class="control-label" style=" font-weight:bolder">截止</label>

                                        <div class="controls">

                                            <span class="text">2017-7-12 下午12:00</span>

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

                                            <span class="text">正在进行</span>

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

                                            <span class="text">第二次作业...</span>

                                        </div>

                                    </div>

                                </div>

                                <!--/span-->

                            </div>

                            <h3 class="form-section"></h3>

                            <div class="row-fluid">

                                <div class="span12 ">
                                    <div class="control-group">

                                        <label class="control-label" style=" font-weight:bolder">作业</label>

                                        <div class="controls">

                                            <textarea class="span12 wysihtml5 m-wrap" rows="6" name="_work"></textarea>

                                        </div>

                                    </div>

                                    <div class="control-group">

                                        <label class="control-label" style=" font-weight:bolder">上传</label>

                                        <div class="controls">

																 <span class="btn green fileinput-button">

																<i class="icon-plus icon-white"></i>

															<span>添加附件</span>

														<input type="file" name="files[]" multiple>

																</span>

                                        </div>

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

                            <button type="submit" class="btn blue"><i class="icon-upload-alt"></i> 提交</button>

                            <a href="/studentHomework"><button type="button" class="btn">返回</button></a>

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

        GAD group 16

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

<script src="ckeditor/ckeditor.js"></script>

<script> CKEDITOR.replace('_work');</script>


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

