<!DOCTYPE>
<html lang="html">
 
<head>
    <meta http-equiv="Content-Type"
        content="text/html; charset=utf-8" />
    <title>jQuery Filer Plugin</title>
 
    <!-- Google Fonts -->
    <link href=
"https://fonts.googleapis.com/css?family=Roboto+Condensed"
        rel="stylesheet">
 
    <!-- Styles -->
    <link href="jqueryfiler/css/jquery.filer.css" rel="stylesheet">
 
    <!-- Javascript -->
    <script src="http://code.jquery.com/jquery-3.1.0.min.js"
            crossorigin="anonymous">
    </script>
     
    <script src="jquery.filer.min.js"
            type="text/javascript">
    </script>
    <script src="custom.js" type="text/javascript"></script>
 
    <style>
        body {
            font-family: sans-serif;
            font-size: 14px;
            line-height: 1.5;
            color: #47505d;
            background-color: #ffffff;
            margin: 0;
            padding: 18px;
        }
    </style>
    <script>
        $(document).ready(function() {
 
 $('#filer_input').filer({
     showThumbs: true,
     addMore: true,
     allowDuplicates: false
 });
});
    </script>
</head>
 
<body>
    <h1 style="color:green">GeeksForGeeks</h1>
    <b>jQuery Filer Plugin</b>
     
<p></p>
 
 
    <div id="content">
 
        <!-- File upload form -->
        <form action="upload_form.php" method="post"
                enctype="multipart/form-data">
 
            <input type="file" name="files[]"
                id="filer_input" multiple="multiple">
                 
            <input type="submit" value="Submit">
        </form>
        <!-- end of File upload-->
 
    </div>
</body>
 
</html>