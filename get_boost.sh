wget https://dl.bintray.com/boostorg/release/1.64.0/source/boost_1_64_0.tar.bz2
tar xvf boost_1_64_0.tar.bz2
mkdir boost_patched
cd boost_patched
tar xvf boost_1_64_0.tar.bz2
mv boost_1_64_0 boost_1_64_0-patched
cd boost_1_64_0-patched
patch -p1 -i ../../boost_patch_ivs.patch
cd ..
