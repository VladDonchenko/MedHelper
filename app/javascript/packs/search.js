$(document).on('turbolinks:load', function () {
    $("#search").autocomplete({
        source: $('#search').data('autocomplete-source'),
        select: function (event, ui) {
            $('#search').val(ui.item.value)
            this.form.submit()
        }
    });
    $('.selector').change(function () {
        this.form.submit()
    });
});
