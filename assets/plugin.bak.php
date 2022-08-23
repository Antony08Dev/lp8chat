<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>plugin</title>
    <!-- font -->
    <link href="/fileuploader/dist/font/font-fileuploader.css" media="all" rel="stylesheet">

    <!-- css -->
    <link href="/fileuploader/dist/jquery.fileuploader.min.css" media="all" rel="stylesheet">

    <!-- js -->
    <script src="//code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
    <script src="/fileuploader/dist/jquery.fileuploader.min.js" type="text/javascript"></script>
</head>

<body>
    <div class="tab" data-id="3">
        <form action="" method="post" enctype="multipart/form-data">
            <input type="file" name="files" data-id="files3" class="files"  data-fileuploader-limit="5">
            <input type="submit">
        </form>
    </div>
    <!-- <form action="" method="post" enctype="multipart/form-data">
        // file input 
        <input type="file" name="files" class="files">

        <input type="submit">
    </form> -->
    <script type="text/javascript">
        $(document).ready(function () {
            $('input.files').fileuploader({
                // Options will go here
            });
        });
    </script>
</body>

</html>