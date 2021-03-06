<%@ page import="com.buaa.mooc.entity.HomeworkSubmit" %>
<%@ page import="java.util.List" %>
<%@ page import="com.buaa.mooc.dao.HomeworkDao" %>
<%@ page import="com.buaa.mooc.entity.Student" %>
<%@ page import="com.buaa.mooc.dao.StudentDao" %>
<%@ page import="com.buaa.mooc.dao.GroupDao" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->


<!-- BEGIN HEAD -->

<head>

    <meta charset="utf-8" />

    <title>作业管理</title>

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

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">

<jsp:include page="teacher_header.jsp"></jsp:include>

<!-- BEGIN CONTAINER -->

<div class="page-container row-fluid">

    <jsp:include page="teacher_sidebar.jsp" ></jsp:include>
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

                        作业列表
                        <small>选择要批改、评分的作业</small>
                    </h3>

                    <ul class="breadcrumb">

                        <li>

                            <i class="icon-home"></i>

                            <a href="teacher">主页</a>

                            <i class="icon-angle-right"></i>

                        </li>

                        <li>

                            <a href="TeacherHomework?cid=<%=request.getAttribute("cid")%>">作业管理</a>

                            <i class="icon-angle-right"></i>

                        </li>

                        <li><a href="TeacherHomeworkCheck?hid=<%=request.getAttribute("hid")%>&cid=<%=request.getAttribute("cid")%>">作业列表</a></li>

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

                            <div class="caption"><i class="icon-pencil"></i>软件开发实习</div>

                        </div>

                        <div class="portlet-body">

                            <table class="table table-hover table-bordered table-striped" id="sample_2">

                                <thead>

                                <tr>

                                    <th>作业名称</th>

                                    <th>组别</th>

                                    <th>组名</th>

                                    <th class="hidden-480">提交日期</th>

                                    <th>批改情况</th>

                                    <th>操作</th>

                                </tr>

                                </thead>

                                <tbody>

                                <%  List<HomeworkSubmit> homeworkSubmits = (List<HomeworkSubmit>)request.getAttribute("homeworkSubmits"); %>
                                <%
                                    if (homeworkSubmits != null && homeworkSubmits.size()>0) {
                                        for (HomeworkSubmit homeworkSubmit : homeworkSubmits) {
                                %>
                                <tr>

                                    <td><%=new HomeworkDao().findByHid(homeworkSubmit.getPk().getHid()).getHomeworkName()%></td>

                                    <td><%=homeworkSubmit.getPk().getSid()%></td>

                                    <td><%=new GroupDao().findById(homeworkSubmit.getPk().getSid()).getGname()%></td>

                                    <td><%=homeworkSubmit.getSubmitTime()%></td>

                                    <td><%=homeworkSubmit.getIsCorrect()==0?"未批改":"已批改"%></td>

                                    <td><a href="TeacherHomeworkChecking?hid=<%=homeworkSubmit.getPk().getHid()%>&cid=<%=request.getAttribute("cid")%>&sid=<%=homeworkSubmit.getPk().getSid()%>" class="btn mini yellow"><i class="icon-pencil"></i> 批改</a></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>

                                </tbody>

                            </table>

                        </div>

                    </div>

                    <!-- END SAMPLE TABLE PORTLET-->

                </div>


                <!-- END BORDERED TABLE PORTLET-->

            </div>

            <!-- END PAGE CONTAINER-->

        </div>

        <!-- END PAGE -->

    </div>

    <!-- END CONTAINER -->

    <!-- BEGIN FOOTER -->

    <div class="footer">

        <div class="footer-inner">

            2016 BuaaSoftware Best Group Null

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

    <script type="text/javascript">  var _gaq = _gaq || [];  _gaq.push(['_setAccount', 'UA-37564768-1']);  _gaq.push(['_setDomainName', 'keenthemes.com']);  _gaq.push(['_setAllowLinker', true]);  _gaq.push(['_trackPageview']);  (function() {    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;    ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);  })();
    </script>
</body>

<!-- END BODY -->


</html>
