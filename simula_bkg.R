simulbkg = function(mapname,ncounts){

    require('FITSio')
    filemap = readFITS(mapname) 
    mappa  = filemap$imDat
    mappa = mappa / max(mappa) # normalized in [0,1]
    axs = filemap$axDat 
    i = 1
    simevents = NULL
    print(axs)
    while (i < ncounts){
          x = as.integer(runif(1, min=1, max=axs$len[1]))
          y = as.integer(runif(1, min=1, max=axs$len[2]))
          v = runif(1, min=0, max=1)
          if( mappa[x,y] > 0 & v < mappa[x,y] ){
             simevents = rbind(simevents, c(x,y))
             i = i +1
             }      
         }
    return(simevents)
}
