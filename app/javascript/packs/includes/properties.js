// toggle show description property button
$(function() {
    $('#toggleDetails').on("click", function () {
        var details = $('#prop-details');
        details.toggleClass("open");

        if (details.hasClass("open")) {
            $(this).text("Show less");
        } else {
            $(this).text("Show more");
        }
    });

    $('#send-message-to-agent').on("click", function () {
        $.ajax({
            url: ""
        })
    });

        // Message popup script
    $('#contact-modal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var modal = $(this);
    });
});
