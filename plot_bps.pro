function read_bps, file
return, { BCWavelength:	 h5_getdata(file,'BCWavelength'), $
          BandPass:	 h5_getdata(file,'BandPass'), $
          NBCWavelength: h5_getdata(file,'NBCWavelength'), $
          NCrossTrack:	 h5_getdata(file,'NCrossTrack'), $
          Wavelength:	 h5_getdata(file,'Wavelength') }
end

pro plot_bps, file, label=label

d=read_bps(file)
bcwavelength=d.bcwavelength
bandpass=d.bandpass
wavelength=d.wavelength

; assumes 12 wavelengths right now
  
;file='OMI_BPS_v01.h5'
;file='OMI_BPS_v02.h5'
;label=replicate('0.42 nm fwhm',12)
;label[9:11]='0.63 nm fhwm'

if ~keyword_set(label) then label=replicate('',12)
for i=0,11 do begin
   plot,wavelength[*,i],bandpass[*,i,0],xrange=bcwavelength[i]+[-1.2,1.2],ystyle=3,xstyle=3,xticklen=-0.02,yticklen=-0.02,ytickinterval=0.25,xtitle='Wavelength(nm)',ytitle='Bandpass'
   oplot,[1,1]*bcwavelength[i],[-1,2],line=1
   xyouts,bcwavelength[i]-1.,.75,string(bcwavelength[i],format='(F6.2)')+' nm!C'+label[i],charsize=.5
endfor
end

;!p.multi=[0,3,4]
;label=replicate('0.42 nm fwhm',12)
;plot_bps, 'OMI_BPS_v02.h5', label=label
;end
