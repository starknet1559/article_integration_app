import $ from 'jquery'
import 'select2'

$(function () {
  $('#post_genre_ids').select2({
    placeholder: "Search Tag"
  });
});