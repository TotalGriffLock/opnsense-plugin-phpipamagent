<div>Configure your phpIPAM Agent here<br>You should have already created an entry for the agent in phpIPAM before you fill out this form</div>
<div>Once set up, you can create cron jobs for discovery and update scans <a href="/ui/cron">here</a>.
{{ partial("layout_partials/base_form",['fields':generalForm,'id':'frm_GeneralSettings'])}}
<script type="text/javascript">
    $( document ).ready(function() {
        var data_get_map = {'frm_GeneralSettings':"/api/phpipamagent/settings/get"};
        mapDataToFormUI(data_get_map).done(function(data){
            // place actions to run after load, for example update form styles.
        });

        // link save button to API set action
        $("#saveAct").click(function(){
            saveFormToEndpoint(url="/api/phpipamagent/settings/set",formid='frm_GeneralSettings',callback_ok=function(){
                // action to run after successful save, for example reconfigure service.
                ajaxCall(url="/api/phpipamagent/service/reload", sendData={},callback=function(data,status) {
                  // action to run after reload
    $("#responseMsg").removeClass("hidden");
                  $("#responseMsg").html(data['message']);
                });
            });
        });
$("#discoAct").click(function(){
    $("#responseMsg").removeClass("hidden");
    ajaxCall(url="/api/phpipamagent/service/disco", sendData={},callback=function(data,status) {
        // action to run after reload
        $("#responseMsg").html(data['message']);
    });
});

$("#updateAct").click(function(){
    $("#responseMsg").removeClass("hidden");
    ajaxCall(url="/api/phpipamagent/service/update", sendData={},callback=function(data,status) {
        // action to run after reload
        $("#responseMsg").html(data['message']);
    });
});

    });
</script>

<div class="col-md-12">
    <button class="btn btn-primary"  id="saveAct" type="button"><b>{{ lang._('Save') }}</b></button>
    <button class="btn btn-primary"  id="discoAct" type="button"><b>{{ lang._('Run one-off discovery') }}</b></button>
    <button class="btn btn-primary"  id="updateAct" type="button"><b>{{ lang._('Run one-off update') }}</b></button>
</div>
<br/><br />
<div class="alert alert-info hidden" role="alert" id="responseMsg">

</div>
