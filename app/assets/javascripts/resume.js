/**
 * Created by jeonjihun on 16. 5. 6..
 */

//$(document).ready(function(){
//    $(".left").height($('.right').height());
//
//});

$(document).ready(function() {
    var print = function () {

        $('#left').height("277mm")

        document.body.inerHTML = selectArea.innerHTML;
        window.print();
    }
});