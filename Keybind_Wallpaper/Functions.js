function table_row(kb, command, left_col) {
  var row = '<tr><td class="kb" style="width:' + left_col + '">';
  row += kb;
  row += '</td><td class="command">';
  row += command;
  row += '</td></tr>';
  return row;
}

function gen_table(header, rows, left_col) {
  var table = '<table><tr><td class="table_header" colspan="2">';
  table += header;
  table += '</td></tr>';
  for (var i = 0; i < rows.length; i++) {
    row = rows[i];
    table += table_row(row[0], row[1], left_col);
  }
  table += '</table>';
  document.write(table);
}
function includeFile(html_file){
    $.get(html_file, function(my_var){
        document.write(my_var)
    }, 'html');
}
