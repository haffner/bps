function read_bps, file
return, { BCWavelength:	 h5_getdata(file,'BCWavelength'), $
          BandPass:	 h5_getdata(file,'BandPass'), $
          NBCWavelength: h5_getdata(file,'NBCWavelength'), $
          NCrossTrack:	 h5_getdata(file,'NCrossTrack'), $
          Wavelength:	 h5_getdata(file,'Wavelength') }
end
