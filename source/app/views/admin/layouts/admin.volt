<!doctype html>
<html class="fixed">
    <head>

        <!-- Basic -->
        <meta charset="UTF-8">

        <title>{{ titleForLayout }}</title>
        <meta name="keywords" content="Admin" />
        <meta name="description" content="Admin Template AAAA">
        <meta name="author" content="okler.net">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

        <link rel="shortcut icon" type="image/x-icon" href="/images/fav.ico">

        {{ partial('partials/common-css') }}

        <!-- Head Libs -->
        <script src="/themeadmin/vendor/modernizr/modernizr.js"></script>

        <script src="/themeadmin/vendor/jquery/jquery.js"></script>

    </head>
    <body>
        <section class="body">

            <!-- start: header -->
            {{ partial('partials/header') }}
            <!-- end: header -->

            <div class="inner-wrapper">
                <!-- start: sidebar -->
                {{ partial('partials/sidebar-left-for-site') }}
                <!-- end: sidebar -->

                <section role="main" class="content-body">
                    <header class="page-header">
                        <h2>{{pageHeader}}</h2>
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