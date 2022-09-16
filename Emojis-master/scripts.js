$(document).ready(function () {

  //document.write('\uD83D\uDE01');

  $("#TypeAMessage").emojioneArea({
    shortnames: true,
    saveEmojisAs : "shortname",
    searchPlaceholder: "¡Busca un emoji!",
    emojiPlaceholder: ":smile:",
    pickerPosition: "bottom",
    

  });

  $("#Send").on("click", function () {
    console.log($("#TypeAMessage").val());

    var data = {
      Mensaje : $("#TypeAMessage").val()
    }

    $.post("upload.php", data, function (res) {
      if (res == "true") {
        var mensaje = emojione.shortnameToImage($("#TypeAMessage").val());
        var p = $('<p>' + mensaje + '</p><br />')
        $("#contenedor-chat").append(p);
      }
      else {
        alert(res);
      }
    });

  });

  setTimeout(function () {
    $("#contenedor-chat p").each(function () {
      var text = $(this).text();
      var mensaje = emojione.shortnameToImage(text);
      $(this).html(mensaje)
    });
  }, 300);


});
