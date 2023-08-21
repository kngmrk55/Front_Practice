function getData() {
    var tabla = $.ajax({
        url: '../getFromDatabase.php',
        dataType: 'text',
        async: false
    }).responseText;

    document.getElementById("data").innerHTML = tabla;
}

document.getElementById("getDataButton").addEventListener("click", getData);