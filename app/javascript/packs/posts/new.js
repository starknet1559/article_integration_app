import $ from 'jquery'
import 'select2'
import 'select2/dist/css/select2.css'


$(function () {
  $('#post_genre_ids').select2({
    placeholder: "Search Tag"
  });
});