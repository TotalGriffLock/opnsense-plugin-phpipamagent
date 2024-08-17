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
            $("#responseMsg").addClass("hidden");
            $("#responseMsg").html("");
            saveFormToEndpoint(url="/api/phpipamagent/settings/set",formid='frm_GeneralSettings',callback_ok=function(){
                // action to run after successful save, for example reconfigure service.
                ajaxCall(url="/api/phpipamagent/service/reload", sendData={},callback=function(data,status) {
                  // action to run after reload
                  $("#responseMsg").removeClass("hidden");
                  $("#responseMsg").html(data['message'].replace(/\n/g,'<br/>'));
                });
            });
        });
        $("#discoAct").click(function(){
            $("#responseMsg").addClass("hidden");
            $("#responseMsg").html("");
            ajaxCall(url="/api/phpipamagent/service/disco", sendData={},callback=function(data,status) {
                $("#responseMsg").removeClass("hidden");
                $("#responseMsg").html(data['message'].replace(/\n/g,'<br/>'));
            });
        });
        $("#updateAct").click(function(){
            $("#responseMsg").addClass("hidden");
            $("#responseMsg").html("");
            ajaxCall(url="/api/phpipamagent/service/update", sendData={},callback=function(data,status) {
                $("#responseMsg").removeClass("hidden");
                $("#responseMsg").html(data['message'].replace(/\n/g,'<br/>'));
            });
        });
        $("#phpipamagent\\.general\\.SSL").click(function(){
            if($("#phpipamagent\\.general\\.SSL").is(':checked'))
                $("input[class*='hidessl']").parents("tr").removeClass("hidden");
            else
                $("input[class*='hidessl']").parents("tr").addClass("hidden");
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
