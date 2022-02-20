results = {"results"=>
  {"roles"=>
    [{"role"=>"Director", "actor"=>{"imdb_id"=>"nm3462290", "name"=>"Michael Matthews"}},
     {"role"=>"Writer", "actor"=>{"imdb_id"=>"nm3929259", "name"=>"Brian Duffield"}},
     {"role"=>"Writer", "actor"=>{"imdb_id"=>"nm2816668", "name"=>"Matthew Robinson"}},
     {"role"=>"Writer", "actor"=>{"imdb_id"=>"nm3929259", "name"=>"Brian Duffield"}},
     {"role"=>"Joel", "actor"=>{"imdb_id"=>"nm3729721", "name"=>"Dylan O'Brien"}},
     {"role"=>"Aimee", "actor"=>{"imdb_id"=>"nm3725055", "name"=>"Jessica Henwick"}},
     {"role"=>"Clyde", "actor"=>{"imdb_id"=>"nm0740264", "name"=>"Michael Rooker"}},
     {"role"=>"Cap", "actor"=>{"imdb_id"=>"nm2045439", "name"=>"Dan Ewing"}},
     {"role"=>"Minnow", "actor"=>{"imdb_id"=>"nm7567556", "name"=>"Ariana Greenblatt"}},
     {"role"=>"Dana", "actor"=>{"imdb_id"=>"nm1712005", "name"=>"Ellen Hollman"}},
     {"role"=>"Rocko", "actor"=>{"imdb_id"=>"nm8723196", "name"=>"Tre Hale"}},
     {"role"=>"Ray", "actor"=>{"imdb_id"=>"nm3273503", "name"=>"Pacharo Mzembe"}},
     {"role"=>"Karen", "actor"=>{"imdb_id"=>"nm5492304", "name"=>"Senie Priti"}},
     {"role"=>"Ava", "actor"=>{"imdb_id"=>"nm1690855", "name"=>"Amali Golden"}},
     {"role"=>"Tim", "actor"=>{"imdb_id"=>"nm2702696", "name"=>"Te Kohe Tuhaka"}},
     {"role"=>"Anna Lucia", "actor"=>{"imdb_id"=>"nm0733541", "name"=>"Tasneem Roc"}},
     {"role"=>"Anderson", "actor"=>{"imdb_id"=>"nm0132889", "name"=>"Thomas Campbell"}},
     {"role"=>"Connor", "actor"=>{"imdb_id"=>"nm1517974", "name"=>"Joel Pierce"}},
     {"role"=>"Kala / Voice of Mav1s", "actor"=>{"imdb_id"=>"nm3148372", "name"=>"Melanie Zanetti"}},
     {"role"=>"Old Pete", "actor"=>{"imdb_id"=>"nm0817748", "name"=>"Bruce Spence"}},
     {"role"=>"Janice", "actor"=>{"imdb_id"=>"nm0680444", "name"=>"Hazel Phillips"}},
     {"role"=>"Maya", "actor"=>{"imdb_id"=>"nm0809402", "name"=>"Miriama Smith"}},
     {"role"=>"Joel's Father", "actor"=>{"imdb_id"=>"nm0117970", "name"=>"Andrew Buchanan"}},
     {"role"=>"Joel's Mother", "actor"=>{"imdb_id"=>"nm0942858", "name"=>"Tandi Wright"}},
     {"role"=>"Bill", "actor"=>{"imdb_id"=>"nm0960946", "name"=>"Damien Garvey"}},
     {"role"=>"Betty", "actor"=>{"imdb_id"=>"nm6176100", "name"=>"Julia Johnson"}},
     {"role"=>"Roberto", "actor"=>{"imdb_id"=>"nm1442745", "name"=>"Ariu Lang Sio"}}]
}}

  filtered_results =  results["results"]["roles"].map {|var|
  if(var["role"] == "Writer")
    var["actor"]["name"]
  end
}

puts filtered_results.compact