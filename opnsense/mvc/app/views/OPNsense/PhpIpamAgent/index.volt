<div>Configure your phpIPAM Agent here<br>You should have already created an entry for the agent in phpIPAM before you fill out this form</div>
<div>Once set up, you can create cron jobs for discovery and update scans <a href="/ui/cron">here</a>.
{{ partial("layout_partials/base_form",['fields':generalForm,'id':'frm_GeneralSettings'])}}
<script type="text/javascript">
    $( document ).ready(function() {
        var data_get_map = {'frm_GeneralSettings':"/api/phpipamagent/simplifiedsettings/get"};
        mapDataToFormUI(data_get_map).done(function(data){
            // place actions to run after load, for example update form styles.
        });

        // link save button to API set action
        $("#saveAct").click(function(){
            saveFormToEndpoint(url="/api/phpipamagent/simplifiedsettings/set",formid='frm_GeneralSettings',callback_ok=function(){
                // action to run after successful save, for example reconfigure service.
            });
        });


    });
</script>

<div class="col-md-12">
    <button class="btn btn-primary"  id="saveAct" type="button"><b>{{ lang._('Save') }}</b></button>
</div>
