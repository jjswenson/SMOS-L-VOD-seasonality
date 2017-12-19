function my_average, ts_data, half_width, valid_ratio
  n=n_elements(ts_data)
  ts_out=make_array(n, /float, VALUE = 'NaN')
  for i=half_width,n-half_width-1 do begin

    tt=ts_data[(i-half_width):(i+half_width)]
    idx=where(finite(tt) eq 0, Count)
    ;idx=where(finite(tt), Count)
    if Count lt valid_ratio*half_width then begin
      ts_out[i]=mean(tt,/nan)
    endif
  endfor
  return,ts_out
end