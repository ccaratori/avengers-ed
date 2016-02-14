function attachHomeworkDatepicker() {
  current_date = new Date();
  current_date.setDate(current_date.getDate() + 1);

  $('.form_datetime').datepicker({
    autoclose: true,
    todayHighlight: true,
    pickTime: false,
    startDate: current_date,
    pickerPosition: "bottom-left",
    format: 'mm-dd-yyyy'
  });
}

$( document ).ready(attachHomeworkDatepicker);
$( document ).on("page:load", attachHomeworkDatepicker);