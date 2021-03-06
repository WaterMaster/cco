<%@ page import="com.buaa.mooc.entity.GroupRecruitView" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

    <meta charset="utf-8" />

    <title>加入团队</title>

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

    <link rel="stylesheet" href="media/css/DT_bootstrap.css" />

    <link href="media/css/jquery.fileupload-ui.css" rel="stylesheet" />

    <!-- END PAGE LEVEL STYLES -->

    <link rel="shortcut icon" href="media/image/favicon.ico" />

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

            <%
                List<GroupRecruitView> groupRecruitView = (List<GroupRecruitView>) request.getAttribute("groupRecruitView");

                if (groupRecruitView != null && groupRecruitView.size() > 0) {
            %>

            <div class="row-fluid">

                <div class="span12">

                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->

                    <h3 class="page-title">

                        团队列表

                    </h3>

                    <ul class="breadcrumb">

                        <li>

                            <i class="icon-home"></i>

                            <a href="student">主页</a>

                            <i class="icon-angle-right"></i>

                        </li>

                        <li>

                            <a href="StudentGroupHome?cid=<%=groupRecruitView.get(0).getCid()%>">团队管理</a>

                            <i class="icon-angle-right"></i>

                        </li>
                        <li>

                            <a href="StudentJoinToGroup">加入团队</a>

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

                    <div class="portlet box blue">

                        <div class="portlet-title">

                            <div class="caption"><i class="icon-table"></i>团队列表</div>

                        </div>

                        <div class="portlet-body">
                            <table class="table table-striped table-hover table-bordered">

                                <thead>

                                <tr>

                                    <th class="span2" style="text-align:center">团队名称</th>

                                    <th class="span6" style="text-align:center">招募信息</th>

                                    <th class="span6" style="text-align:center">团队人数</th>

                                    <th class="span2" style="text-align:center">操作</th>

                                </tr>

                                </thead>

                                <tbody>

                                <%
                                    for (GroupRecruitView item : groupRecruitView) {
                                %>

                                <tr>

                                    <td style="text-align:center"><%=item.getGroup_name()%></td>

                                    <td style="text-align:center"><%=item.getRecruit_information()%></td>

                                    <td style="text-align:center"><%=item.getS_count()%>
                                    </td>

                                    <td style="text-align:center"><a
                                            href="StudentJoinToGroup?grid=<%=item.getGrid()%>&cid=<%=item.getCid()%>"
                                            class="btn mini green"><i class="icon-ok-sign"></i>申请加入</a></td>

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

            <% } %>

            <!-- END SAMPLE TABLE PORTLET-->

        </div>

    </div>

    <!-- END PAGE CONTENT-->

</div>

<!-- END PAGE CONTAINER-->

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

<script src="media/js/jquery.uniform.min.js" type="text/javascript" ></script>

<!-- END CORE PLUGINS -->

<script src="media/js/app.js"></script>

<script>

    jQuery(document).ready(function() {

        // initiate layout and plugins

        App.init();

    });

</script>

</body>

<!-- END BODY -->

</html>