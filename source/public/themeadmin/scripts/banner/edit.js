$(document).ready(function() {
        $("#image1").on("click", function() {
            openKCFinder(this);
        });
});
function openKCFinder(textarea) {
    window.KCFinder = {
        callBackMultiple: function(files) {
            window.KCFinder = null;
            textarea.value = "";
            if (files.length > 1) {
                showPopupMessage("notification", "Please choose one file");
                return;
            }
            for (var i = 0; i < files.length; i++) {
                textarea.value += files[i];
            }
        }
    };
    window.open('/themeadmin/kcfinder/browse.php?type=images',  'kcfinder_multiple', 'status=0, toolbar=0, location=0, menubar=0, ' +
    'directories=0, resizable=1, scrollbars=0, width=800, height=600');
}
