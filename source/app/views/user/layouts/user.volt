<!doctype html>
<html class="fixed">
    <head>

        <!-- Basic -->
        <meta charset="UTF-8">

        <title>{{ titleForLayout }}</title>
        <meta name="keywords" content="HTML5 Admin Template" />
        <meta name="description" content="Porto Admin - Responsive HTML5 Template">
        <meta name="author" content="okler.net">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

        {{ partial('partials/common-css') }}

        <!-- Head Libs -->
        <script src="/admin/vendor/modernizr/modernizr.js"></script>

        <script src="/admin/vendor/jquery/jquery.js"></script>

    </head>
    <body>
        <section class="body">

            <!-- start: header -->
            {{ partial('partials/header') }}
            <!-- end: header -->

            <div class="inner-wrapper">
                <!-- start: sidebar -->
                {{ partial('partials/sidebar-left') }}
                <!-- end: sidebar -->

                <section role="main" class="content-body">
                    <header class="page-header">
                        <h2>{{pageHeader}}</h2>

                        <div class="right-wrapper pull-right">
                            <ol class="breadcrumbs">
                                <li>
                                    <a href="index.html">
                                        <i class="fa fa-home"></i>
                                    </a>
                                </li>
                                <li><span>{{pageHeader}}</span></li>
                            </ol>

                            <a class="sidebar-right-toggle" data-open="sidebar-right"><i class="fa fa-chevron-left"></i></a>
                        </div>
                    </header>

                    <!-- start: page -->
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-xl-12">
                            <section class="panel">
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            {{ content() }}
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </div>
                    </div>
                    <!-- end: page -->
                </section>
            </div>

            <!-- start: sidebar -->
                {{ partial('partials/sidebar-right') }}
            <!-- end: sidebar -->
        </section>

        {{ partial('partials/common-js') }}
    </body>
</html>