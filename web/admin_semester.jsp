<%@ page import="com.buaa.mooc.entity.Term" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--><html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

    <meta charset="utf-8"/>

    <title>学期管理</title>

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

    <link rel="stylesheet" type="text/css" href="media/css/select2_metro.css"/>


    <!-- END PAGE LEVEL STYLES -->

    <link rel="shortcut icon" href="media/image/favicon.ico"/>

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">

<jsp:include page="admin_header.jsp"/>

<!-- BEGIN CONTAINER -->

<div class="page-container row-fluid">

    <jsp:include page="admin_sidebar.jsp"/>

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

                        学期管理

                    </h3>

                    <ul class="breadcrumb">

                        <li>

                            <i class="icon-home"></i>

                            <a href="eduadmin">主页</a>

                            <i class="icon-angle-right"></i>

                        </li>

                        <li>

                            <a href="semester">学期管理</a>


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

                    <div class="portlet box red">

                        <div class="portlet-title">

                            <div class="caption"><i class="icon-cogs"></i>学期列表</div>

                            <div class="tools">

                                <a href="javascript:" class="collapse"></a>

                                <a href="#portlet-config" data-toggle="modal" class="config"></a>

                                <a href="javascript:" class="reload"></a>

                                <a href="javascript:" class="remove"></a>

                            </div>

                        </div>

                        <div class="portlet-body">

                            <div class="btn-group">

                                <a href="AddSemester">

                                    <button class="btn green">

                                        添加新学期 <i class="icon-plus"></i>

                                    </button>
                                </a>

                            </div>


                            <table class="table table-striped table-bordered table-hover" id="sample_editable_1">

                                <tr>

                                    <th>学年</th>

                                    <th>季度</th>

                                    <th>开学日</th>

                                    <th>结束日</th>

                                    <th>周数</th>

                                    <th>删除</th>

                                </tr>

                                <tbody>

                                <% List<Term> terms = (List<Term>) request.getAttribute("terms"); %>

                                <%
                                    if (terms != null) {
                                        for (Term term : terms) {
                                %>

                                <tr>

                                    <td><%=(term.getYear() != null ? term.getYear() : "未设置")%>
                                    </td>

                                    <td><%=(term.getQuarter() != null ? term.getQuarter() : "未设置")%>
                                    </td>

                                    <td><%=term.getStartDate().toLocalDate().toString()%>
                                    </td>

                                    <td><%=term.getEndDate().toLocalDate().toString()%>
                                    </td>

                                    <td><%=(term.getWeeks() != null ? term.getWeeks() : "未设置")%>
                                    </td>

                                    <td>
                                        <a href="DeleteSemester?termId=<%=term.getTermId()%>" class="btn mini black">
                                        <i class="icon-trash"></i> 删除</a>
                                    </td>

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

                <!-- END SAMPLE TABLE PORTLET-->

            </div>


            <!-- END BORDERED TABLE PORTLET-->

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

<script src="media/js/jquery.uniform.min.js" type="text/javascript"></script>

<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->

<script type="text/javascript" src="media/js/select2.min.js"></script>

<script type="text/javascript" src="media/js/jquery.dataTables.js"></script>

<script type="text/javascript" src="media/js/DT_bootstrap.js"></script>

<!-- END PAGE LEVEL PLUGINS -->


<script src="media/js/app.js"></script>

<script src="media/js/table-editable.js"></script>

<script>

    jQuery(document).ready(function () {

        // initiate layout and plugins

        App.init();

        TableEditable.init();
    });

</script>

</body>

<!-- END BODY -->

</html>