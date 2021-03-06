#!/bin/sh

# Display usage
cpack_usage()
{
  cat <<EOF
Usage: $0 [options]
Options: [defaults in brackets after descriptions]
  --help            print this message
  --version         print cmake installer version
  --prefix=dir      directory in which to install
  --include-subdir  include the Tutorial-1.0-Linux subdirectory
  --exclude-subdir  exclude the Tutorial-1.0-Linux subdirectory
  --skip-license    accept license
EOF
  exit 1
}

cpack_echo_exit()
{
  echo $1
  exit 1
}

# Display version
cpack_version()
{
  echo "Tutorial Installer Version: 1.0, Copyright (c) Humanity"
}

# Helper function to fix windows paths.
cpack_fix_slashes ()
{
  echo "$1" | sed 's/\\/\//g'
}

interactive=TRUE
cpack_skip_license=FALSE
cpack_include_subdir=""
for a in "$@"; do
  if echo $a | grep "^--prefix=" > /dev/null 2> /dev/null; then
    cpack_prefix_dir=`echo $a | sed "s/^--prefix=//"`
    cpack_prefix_dir=`cpack_fix_slashes "${cpack_prefix_dir}"`
  fi
  if echo $a | grep "^--help" > /dev/null 2> /dev/null; then
    cpack_usage
  fi
  if echo $a | grep "^--version" > /dev/null 2> /dev/null; then
    cpack_version
    exit 2
  fi
  if echo $a | grep "^--include-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=TRUE
  fi
  if echo $a | grep "^--exclude-subdir" > /dev/null 2> /dev/null; then
    cpack_include_subdir=FALSE
  fi
  if echo $a | grep "^--skip-license" > /dev/null 2> /dev/null; then
    cpack_skip_license=TRUE
  fi
done

if [ "x${cpack_include_subdir}x" != "xx" -o "x${cpack_skip_license}x" = "xTRUEx" ]
then
  interactive=FALSE
fi

cpack_version
echo "This is a self-extracting archive."
toplevel="`pwd`"
if [ "x${cpack_prefix_dir}x" != "xx" ]
then
  toplevel="${cpack_prefix_dir}"
fi

echo "The archive will be extracted to: ${toplevel}"

if [ "x${interactive}x" = "xTRUEx" ]
then
  echo ""
  echo "If you want to stop extracting, please press <ctrl-C>."

  if [ "x${cpack_skip_license}x" != "xTRUEx" ]
  then
    more << '____cpack__here_doc____'
This is the open source License.txt file introduced in
CMake/Tutorial/Step7...

____cpack__here_doc____
    echo
    while true
      do
        echo "Do you accept the license? [yn]: "
        read line leftover
        case ${line} in
          y* | Y*)
            cpack_license_accepted=TRUE
            break;;
          n* | N* | q* | Q* | e* | E*)
            echo "License not accepted. Exiting ..."
            exit 1;;
        esac
      done
  fi

  if [ "x${cpack_include_subdir}x" = "xx" ]
  then
    echo "By default the Tutorial will be installed in:"
    echo "  \"${toplevel}/Tutorial-1.0-Linux\""
    echo "Do you want to include the subdirectory Tutorial-1.0-Linux?"
    echo "Saying no will install in: \"${toplevel}\" [Yn]: "
    read line leftover
    cpack_include_subdir=TRUE
    case ${line} in
      n* | N*)
        cpack_include_subdir=FALSE
    esac
  fi
fi

if [ "x${cpack_include_subdir}x" = "xTRUEx" ]
then
  toplevel="${toplevel}/Tutorial-1.0-Linux"
  mkdir -p "${toplevel}"
fi
echo
echo "Using target directory: ${toplevel}"
echo "Extracting, please wait..."
echo ""

# take the archive portion of this file and pipe it to tar
# the NUMERIC parameter in this command should be one more
# than the number of lines in this header file
# there are tails which don't understand the "-n" argument, e.g. on SunOS
# OTOH there are tails which complain when not using the "-n" argument (e.g. GNU)
# so at first try to tail some file to see if tail fails if used with "-n"
# if so, don't use "-n"
use_new_tail_syntax="-n"
tail $use_new_tail_syntax +1 "$0" > /dev/null 2> /dev/null || use_new_tail_syntax=""

extractor="pax -r"
command -v pax > /dev/null 2> /dev/null || extractor="tar xf -"

tail $use_new_tail_syntax +152 "$0" | gunzip | (cd "${toplevel}" && ${extractor}) || cpack_echo_exit "Problem unpacking the Tutorial-1.0-Linux"

echo "Unpacking finished successfully"

exit 0
#-----------------------------------------------------------
#      Start of TAR.GZ file
#-----------------------------------------------------------;
� ,�/` �}tՕ��daZ��AB!�F�?ˀ��R�-[��E1�[�%�C�[tW�����c��p˙�e��2٬7g�%,`rf��o~�0�J@��Ip�����W��$�I���W�{����{��P<y5��]CC��������nna��|M�W75�4k�F_K�Z>섡�f�H��N������3����c�����g�T:I|Xq�^�M�������Ҩ�UC+�>���/���
v�w�\���\O04|����?�*��'m��]I.! \&�����ࢅ_��J����,���[��N�.�/���o�YE,>!Z�������ǶZ�wx:�R+����|G8��5��比��9��~���������J^Q���q���O�2'�����T.!�~�z�:jm�:[��'����ZW�6{3)o#MS���=@�E9j<�K	kxՑ��׵������㹧������#�������\����A�|�[O���϶_}���+��﷞7��7���]K\�>�y��������ˈ�y�����?� g���AN�>� �k���;��΁�.�����~���rr�ҭ����ohV|%�W��	�?�l��[�Iqy�c��	K�v�?A��-'��*�П���z�s�Y�MF�x*���Ot}�h*��b�:�o��5�Ѱ j�ܞ6�1�Ǔq���ࡠ��^y%><��ԟi���1_��Y��3c�������m�-���C����	r:|�팭���͓����n��S;�T��S�z:��f �u|\3ҙT2�������,X���p'�G�۲�FҤl@�a4�T"�S,���7}��H$���H��@�}�5AB�Q=�1�Fd�3փ�-zN���%:������n�Y�k�|�Ɍ�6;cH�
�v�ӎ��<�
��E�:V��G��x2坁<��(#�(�Ԕ����
Ӎt:���h� d�>�b�"fne2(�y�݆�v���@6tu�k�����>8Xש��M�f�9��n��~�J�5�J�w���?��(��']������s�����.�}�~vy���5w��l$���_��me8B'����ލ=�6�\�����Xɞ�<��Sy��Ws|!ɏE�4	���Ix��7Hx���I�<��K�<Ά$|���Jx��J�9�U�/��	���1	?W��%|�����$�����^-�Jx��?,�U��Vyhoپe	�s�,����ϗb�gZ�[3���+�p���5}t����0V��aNc�x� �X��hx�X�����ƪ��O�}�*��E�1�ɞ��u�*��J��`�j���1�U1���+0�U0�@�5Ƣ��hx9��ȧ�hx	����	W`�r��1��p�?�~)���Cx�?4�6jh���򾧰0�n/��^���Zm�6�	��W���>���EV��	M�t��vKm���ť��{� �v�$5�{.r���Z�2���OM�1��*��z��v�$�|2����|�7�vh�ũ% ��e@��Wٝ��rW�=;�6 x���B}��C���T��ߡ���� ��&�ũ7OB�~�s��.^�r�����{��oyxҦnf�&2Ճ����x� �	ڞv@��ynO�F���~%��~��tj䏂�'�`+�V�ܓk�ϼ���4�{�P=��gp���|�!�}��|�����C���Xo��Ń1U/>�K� �T �y�BB���}�����-���q���-�୙��+w!�����%@�|.��7�\�C/����{��|������Z�O�kЭ/ Ω�A���B�� ��>�9�^�h%��䒰t��ð: ��÷L�9�EB�3�|*09��s���@�䫁p׾�����оU���w�����г'K��~�(�{~e^"ʳk��w;@����vr�ּ�}�ӷ�n	���ϗ�ۇxû����q�F���P�/�D��hDKfG��4�0��G-s{6�64��R�@�h(��k���c�P����gf��Zh�0�͐��Ъ��[ߠs��G\�U��-,��ZX�8�i�}��N{z�.@�#���i�V�Z��Xy��]���^�T[C��N����JXX�S�!�*�d�|������$੺��T�.����~��SH�S8���~,?H��(��Su���Ϋ�Րo�u��/�����J�m_i�S�������!O�=���-�ix��y�u�j�_rP�;��9��1a�u������~�&o���>I/��芮芮芮芮芮�����5����(�.�>ಆ�T���b/Q���=Dq�r�sËyX�.��K��X������q&���n&O콶����s=��/�E��{�ˈ���~�>�XK�������{���|�t��+�em�2��8���]�'��N�c��^Ϗp�q���׸�K�������_��V�������v�������t���nC�@���m�h������&��ψi����U���s���o`�ݹsz+^BL[�4�n�xY��Z��vm�ڶ�lm�v�9��h�+r�֊��2|�e��G��/<Wex%9l�W����b2h�/!�=U����_���\�bŗ�ö�����zqeūs����<j��ϑ���v?��3*�n(ѿ_��ʳ�����E?�s�s�),�N.�?����
~+��q���9��g7�.��ǸM��8�/�_�|�J���J;y���8���-l��ⲩ�j����U�q5��Q9����4��tЗ�Bq�^nb�:�f��R_	��˝�]���@�����r}�f���p��o���ݨב��Y�q�g��?nF/v_D(��%z,%�z#�wW�#Jy�������q�A��{��Z���̤���怿Wb�o�e��ri���58��-�Ƒ�y��Tb��CL��ꍎ�}CWϺ@��g�Cz'װ����j��x�*�D�f��{Q�ec{�����u3�ƶx�4Һ9�G����XJߖHEz����8��F��iļ�M--�DTWG��ӑ	�H��	2���z,;::,R�*�XHu}}_`sPvw�ZM����q�PG_.�=����z8��+���1+�M:n�l�lϫ������V�f�L�P]i�#E����m|y�~���̩lT��6���c��
Ԝ9�(���i:)B:{�Lb���z�U��7���Q��U�����z,��G"�X����)LJq�ZKV�ȼk>���l�8U����KPV�-������5?ě�5#C��]ꏈ�x��1�M�L��W��m<�-��e�تx���H$3B���$�c��fw���eK@�{i#AB~5�01J�/4S���7����#����!���x�3uH4ԧ7��3��3�4MXd4��IX�,�ZⅮ.����d�+��6�P�]J�2b����G���З*a��/�e&j���s�wa.����Aw�>:�!�p��&l�A���G9 ��p��%���	�ȕ_����v����)�b��]�QѨ�߭���G��F�yBw�|�KHa�� �L�X���b_D-?��=����N(�e�8���놣�|cH�7	�����/ֿ�8�R�U���/�7�F�YِXu��=���y��\	��^M��������aοQ�W��Q�?��_�Ы�?���u���W�O����/����R�Om��#l�,�9����]��?!LQ����K�O���O�����s���N�l�˿W����"_'��žŉ��K�I�?��՘���\V~��z���E�?|O�\��op�j�AS����w��*����':���~����9GJ����1�R j�;���*�/WT�3���h"3>�w@O��Ϧ������gÉ����2rF㘫��}��olhh��oY�\|�󬸊���Z̀����?����X_q��Ihp���/�ٽA�|��@8D�k���l����k��4��̘��%��X*mRR#�1��ͳ$c��ːS��j-�Jj��K���]E�Q�
X���H��,�ڝ�TVO��q㠎����V쬘���<�x��;����p|ۙ� �z�}����7��߭0������2G-J�=�6bZj�=5�dL��On�hé�&�H�e��~c�����[���ӧ�f!���������#����?|����pX����m�
�4���M��?+._���m�^��(���pN�o	�I!�;�8����-��_c��������p�1���`���tjT���76���ΰ_���uXa��f�ч�	��^�rr�I���֌f�`��Y$��B.�І-��H�H�M�H�|��&�qSk��LKg��E��O�eM.%���f�'�Y�e"y��&�:����FҬ������;:����;�76�����`w�i���W{���X���5�W���QWQ�WhZ�l	�<��Hr�aS���6۞����J	#�1N�#���o�����@q�wV�e�>���L�`$�tĄ��=�&m.��a�+�EB��>֘j�<�����(t`m42	$z�ے��g��G#������c�R�f����wv�2U��ìu�����X����r����tj�H�u�@߆`X��k���`w������ߤ�T;�������aHH���
��sA�,%Br���Y�ri���
-/����
ӹ,�FD�Yo�?�u���jd9�=ݨ����@E��g�:�CS{(ؾIgeѯF�,X/����>��s
���j�����JG��^��IY�C=vvo��8�[h�]��0b��k�}p��4k^���w5ʉ�_%��M����=dL��16�Kœ��Ie1-�2��=�������1�=�e�\�Skk��gu�j�������p�v�6�?�џ�����u���O%}�q�����g����g��0��p����h_tܝ����s���[�������8��'��Cl �����6�衮xtvzs0�����~���R݉6jd�[ku��@������N�_T��-mܞ���XM}�ߨ����KK%�щ�ށ���x�M^���30}���#;M�M�L#jj�m�x2cj�لK�^i4�E9Wi;F��m�6�#� FR�$�F$6�s�IaO����p+8�D]�T�`i�X��)�[��iō�1H��G}dψDG�;ʴ@��E�f����p"�-#�>��,Ï�C�ډ,�ĺ{���i�ys`�Fr�O:����#���?���@���J��Aq٤me�7�
��+�TM�c��4�S�ӋX�0��d]���3G�h�m;��Ԩ��eM:1�$���O��SI��j;l���zn�-I�~x��h���a< +VH�/:���7��w.w�R�}�X�4hρ�>��b���>��{Gf|�a9}�:�X�fGX�P�T	pނ�i�G�jD�ͷ��kD�V�I��u -�@�B�=Z����\ʲ�?�v�&� ��{��Agw{�@Gσ���>�o7���I5^����\�`l�pM�l�v`��ߩw�%e��p�P,�=�{�CZ��0s��q|�R��jl){z��fK�u�_�����zg�5��*з�=In�*0�-�d������kgg��c;P�^�Ҡg)Fya��E_�����<�f � �!�|D��щ`������Y�s���IA�`��+q|�3��`֒��gbT��m���^��ו�Ġ�c'��pM����(-K|����������n|C[ck}�ڥ��A�+�Ql~4��,�MPأYW{��Ne��&�0"��f�H��G�r�F�O�,O:/��=h�1ߺ0L�nŇ���0�Lh����	-a��K/o���Ĳ5�S�����R�7j�d�v2�ܼ,8�MK��w�P�Ӳ�&'{K4�a�a�a�k�����T�t!��KlT�Y�jZo*���V�`��+蚊+�:BN!f��\�ج���(�;��G@�T�x��쁤h�H�M� <�Q#���I,��8��	�L6
y�g�v�<�q��e�G`0A�ڿ��ȽS���O�B�l�Raz+jX��编���*�U�J���͋6�pa=Ō1��+���[��D���C,z�Ph�`3PaX��U�����"�"�&�޳�/U8U����ۧg4����}M��7}�����qV�j����;�[���Պ�����1������k��W��=��w}�c����#C%V>aG� �;�酯���c{�gU���j%zt��x�Z����?S�؜�e��K���T�j�}��O�=Զhˡr�ߑ{v�/?II쪽��ʴR�y�9?~����.��*^��վ���oΖ��;|�	��l��>� �)�-�|�C�mxa�^Sݯ	+O�-q�����Ƿ:Пp���]%��S<�k�����QM��_A���"����������U��rL�p�_D�<V�!�ۅd�3(n�%�,����z��NaX��=L?�B��ߡ_�D�nܮ�q:X�e2�Y(�O�i�0�J��N�I��5�7�T��38-Q����p�Q�Le�τمjM�i,k��e8�͌P�n�֪�������vz7�7�Y�m�7[��Ę�|M@�#3�� �]^�<E�JC���d�펶�m�ɶ�3xN���ڜ,���f�9�P��|v���@K�u)����.�����U{i��F�^�{�|�죕�!�9�7�8��K���q@�kG��FVp�A�G�a�?��"|p%�U{l/I��݂�.�?;"��(�J��ULI�<�=&Ო�.�'���I�}�<n����O64H�<�i���p�}�<.�W�e;m�.�i�*�rW:"�=�1	����g{lǩ=�wr�؎+���P��\������{l�U�=��c{R���-��c�=��*����c��]*�ڻC��\S��͇�������RcT~j:m���Bx߲���������˧���a�/{�}k1��P�	������tA��Y�
��-h���e�3��H��P�b�+�wYe�0�&_@]~�k��H���kW�m�v��E ���52�����aV�ʗ�v���־�ļ���Y� �� �6�>Emw����	��/��k�h	�+?53\Yw,�b����`��*��	�p٭��K�WV�mqS�ʿ^� �lmy��UYH	0]Wx
���zA����OM�f����wrf&��-W��hD�+���NW�~�Bu�T[{��&�זC�=�=�S������rS�M�M����y�:r�r�G���S{NR�u� �z-��k�E`S���M�'s��~:u7����^��
��۲cHy�+��pםm��U3̄ܫ�c�*y��
��Lo���=���u�dʪ��I��M�>D���jf�����0�RO^��7��߹7H��q�����0f'/U�����T����04�_/���p(�=��;LS1�+ ��"?ȣǼ�S��7�6�
r��d���l�1fa1-�{_q3Ih�#��A;*v���8�`V؀k��%�K���gw�����70��k��?z�lá��$�4�b�	F���㼹j� o_|�h.�kS���9��א�w��ķ��8��~�>�����.¾�| ���z��j�{���%�voi�S�����/�������M�����<���b<�<U�zԯ@]�]�]�]�]�]��G͉}]������b�V�q���m+W��(a�}a������^�8�{���F�y��Nv�ľ����c�����盯b�T|G^��u��?f�]m�n�˭��ޯH��w�����]7��붂�����!T\��\q��o��z����a�o�������p�q����f�h9vþ��y졇߽��W���������a�u�}�[�{���r����e��F������,o��LڊC;q/��pw�[�\��⥹vn��r�Ŋ/ȵ3+�0�^�xy�][��sY�W�*��@;qGm��s\��GmqONOW��J;�*ׯX�Ź�Ċ/!l��s��_j���N�8�����+�?������� �!����w���/�X�9.:@/�o&�N�����w�����_q��8���[�����7xz�(��_��kS���"���_S���p��>_N�]I�_I�*�m�˾���54#�����컩�d��zI��sg��t1{yj�����]�z*O8�N��N���3J�չ��B6���N9w9�_wۧ�����^λn{����}��^�e���������ԁ~a����R{��j;k�R{���5Y���M����za�����Y�Bh&΄e6�d���V�����j�˪�d��4����4��'Ԧ�e�m^�N�a�m>V�΀^W��7;�hgR����j<Mhp�ؙ;=u1�`Z26o+m��W���)b��<�崏����-�+J)g�<]˺FN��©�������:C��>�X���~�c�퓉����}2��E
�����>�X����Q�A!b�O&�7+�d"��}�b�O&�A��J��w���ǈ�>�X/	_�����O�}2�����?�ktb\�\��2
�X�	��B��'���/��O�a�l��/�]�O�7D����
�Z_V�����X��M��h���N�l_,����s�C�h�}1��yt��Ş#V�Zb�r`���^T��z�y�B�����,8 �2�(�+���An���������W�sj?�S���]�?�o.�+���}21?�Y�N���%������'+����&�3�b���'���4�]�퓩d�m���pv��:�q��������Q}�������ݥ�E�ё�+�V>��&�V���inѴ�ȿ���&(��U�p��y�#�k��N𦮶�u͚f�YҚ״4�X�7]��E�UK;[~���,%��dFz�ɌW6��ϥɌAԹE�44��M�df��i2�;B��F�EH�̜�i2���S��;i2s�e�B�]�YN��d���4��R�i2��<5����צ쟓3w2�����ͧ�1=��4-XZ���Q޷L*v�f�5��մ>�#6'k��)��!-f�gJCz�7i�t%��9;���ߝf3�<��Bos�G�ɟ=^x�����$)�N9�%D9����9�6�{���.N�+���x��g�oa~�9���;9��
~7�W%�5�U���T��ǜ_"��DtNp?_��de�˞��_�_ဏ;�_r��E��ͷs��zʁ��-��|�Y�,v�ӟ�oW{�4��j�iş6���O��8|�ׄ�9���&�|�"�VL�弙`�����s�X�7p{�~�h��YxF�/���$�K$�i	?_HrVJ�/%\��_Ir�J�I9.{9�%�R	���I�	�@�wKSr���D��E�WN�.��?I�\ίI��Hx��C%�Z�/�p1b!�\�#�s��/��k%\�3���K�rI��~���+$���pӑB�5I��e	����K�e�0��=�a�3ҩI�f���mFbB�ڠ�������,;�!�,��D3f[�`�>��s0Fo�l�à3�4b������ؤ�I�#WJ
w8���{�_B�O^.'��'w[�ɍMzew��\
���*�n%����\���H����F��_F
��2����;��_�#����_������Ͽ�ԫ�j�G�}�Gx���0��R��;���A�^�ur��!�6��M�8�u�B-�A���O�w�w9��Z�����&�~iU@�-b�{~��?��jy�b_~U|I�a,�*RX~N;�!��:�Ӂ��E6�N;���9N^�v�y��R���}�]��_����p:� �  