PGDMP                   	    	    {            database 2.0    15.1    15.1 #               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16388    database 2.0    DATABASE     �   CREATE DATABASE "database 2.0" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "database 2.0";
                postgres    false            �            1259    16390    buyer    TABLE     �   CREATE TABLE public.buyer (
    id integer NOT NULL,
    firm_name character(256) NOT NULL,
    adress character(256) NOT NULL,
    phone character varying(20) NOT NULL
);
    DROP TABLE public.buyer;
       public         heap    postgres    false            �            1259    16389    buyer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.buyer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.buyer_id_seq;
       public          postgres    false    215                       0    0    buyer_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.buyer_id_seq OWNED BY public.buyer.id;
          public          postgres    false    214            �            1259    16399    product    TABLE     �   CREATE TABLE public.product (
    id integer NOT NULL,
    seller_id integer NOT NULL,
    product_name character(256) NOT NULL,
    quantity integer NOT NULL,
    price integer NOT NULL
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    16398    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    217                        0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    216            �            1259    16408    seller    TABLE     �   CREATE TABLE public.seller (
    id integer NOT NULL,
    firm_name character(256) NOT NULL,
    adress character(256) NOT NULL,
    phone character varying(20) NOT NULL
);
    DROP TABLE public.seller;
       public         heap    postgres    false            �            1259    16407    seller_id_seq    SEQUENCE     �   CREATE SEQUENCE public.seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.seller_id_seq;
       public          postgres    false    219            !           0    0    seller_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.seller_id_seq OWNED BY public.seller.id;
          public          postgres    false    218            �            1259    16417    transaction    TABLE     �   CREATE TABLE public.transaction (
    id integer NOT NULL,
    buyer_id integer NOT NULL,
    product_id integer NOT NULL,
    quantity integer NOT NULL,
    sum integer
);
    DROP TABLE public.transaction;
       public         heap    postgres    false            �            1259    16416    transaction_id_seq    SEQUENCE     �   CREATE SEQUENCE public.transaction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.transaction_id_seq;
       public          postgres    false    221            "           0    0    transaction_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.transaction_id_seq OWNED BY public.transaction.id;
          public          postgres    false    220            t           2604    16393    buyer id    DEFAULT     d   ALTER TABLE ONLY public.buyer ALTER COLUMN id SET DEFAULT nextval('public.buyer_id_seq'::regclass);
 7   ALTER TABLE public.buyer ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            u           2604    16402 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            v           2604    16411 	   seller id    DEFAULT     f   ALTER TABLE ONLY public.seller ALTER COLUMN id SET DEFAULT nextval('public.seller_id_seq'::regclass);
 8   ALTER TABLE public.seller ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            w           2604    16420    transaction id    DEFAULT     p   ALTER TABLE ONLY public.transaction ALTER COLUMN id SET DEFAULT nextval('public.transaction_id_seq'::regclass);
 =   ALTER TABLE public.transaction ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221                      0    16390    buyer 
   TABLE DATA           =   COPY public.buyer (id, firm_name, adress, phone) FROM stdin;
    public          postgres    false    215   &                 0    16399    product 
   TABLE DATA           O   COPY public.product (id, seller_id, product_name, quantity, price) FROM stdin;
    public          postgres    false    217   g'                 0    16408    seller 
   TABLE DATA           >   COPY public.seller (id, firm_name, adress, phone) FROM stdin;
    public          postgres    false    219   �'                 0    16417    transaction 
   TABLE DATA           N   COPY public.transaction (id, buyer_id, product_id, quantity, sum) FROM stdin;
    public          postgres    false    221   G)       #           0    0    buyer_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.buyer_id_seq', 5, true);
          public          postgres    false    214            $           0    0    product_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.product_id_seq', 5, true);
          public          postgres    false    216            %           0    0    seller_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.seller_id_seq', 5, true);
          public          postgres    false    218            &           0    0    transaction_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.transaction_id_seq', 272, true);
          public          postgres    false    220            y           2606    16397    buyer pk_buyer 
   CONSTRAINT     L   ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT pk_buyer PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.buyer DROP CONSTRAINT pk_buyer;
       public            postgres    false    215            {           2606    16406    product pk_product 
   CONSTRAINT     P   ALTER TABLE ONLY public.product
    ADD CONSTRAINT pk_product PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.product DROP CONSTRAINT pk_product;
       public            postgres    false    217            }           2606    16415    seller pk_seller 
   CONSTRAINT     N   ALTER TABLE ONLY public.seller
    ADD CONSTRAINT pk_seller PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.seller DROP CONSTRAINT pk_seller;
       public            postgres    false    219                       2606    16424    transaction pk_transaction 
   CONSTRAINT     X   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT pk_transaction PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.transaction DROP CONSTRAINT pk_transaction;
       public            postgres    false    221            �           2606    16425    product fk_product_sell_seller    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk_product_sell_seller FOREIGN KEY (seller_id) REFERENCES public.seller(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 H   ALTER TABLE ONLY public.product DROP CONSTRAINT fk_product_sell_seller;
       public          postgres    false    217    219    3197            �           2606    16430 !   transaction fk_transact_buy_buyer    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_transact_buy_buyer FOREIGN KEY (buyer_id) REFERENCES public.buyer(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public.transaction DROP CONSTRAINT fk_transact_buy_buyer;
       public          postgres    false    215    221    3193            �           2606    16435 '   transaction fk_transact_contain_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.transaction
    ADD CONSTRAINT fk_transact_contain_product FOREIGN KEY (product_id) REFERENCES public.product(id) ON UPDATE CASCADE ON DELETE RESTRICT;
 Q   ALTER TABLE ONLY public.transaction DROP CONSTRAINT fk_transact_contain_product;
       public          postgres    false    217    3195    221               >  x��AJ1���)r��L2�9�7p#ؕ� �� ��2�C;���Wx�Q���n,�j��[$�y<���d�� ���L���W̰���``�Pa�)
�T.EN�F�!���;��hel�+�̥M)_��YR*h�R�A=h1�,��i���+��h�T��jI�ST��ȍ}���M˅&�r�K���!�������ӯow��w�-��$I��I!��{y|v�==��̏�'�̈h)\���^0"~?"y`��1�K��дФ���p���������dK�e��K�a(}�޺ZZb������9_�k�         p   x����� ��PY@C/^�n������&80L^f�0������9�@Xc}|�ݺW� ��aa�vf�K�s"uv.�|�{Kp�pd��_����d��W�A)����         P  x��VKN�0\ۧ���N�܅Ð~`A%�R�X�����
�1�*
R��`$��<�7�F�[���Ǿ����?���;:���+E&��J�y���&�����qγh�'�2���� \e*sb4��~���b|�a��`�/��W4$f�E��	�D�iH�IrXG׻�k�����ew9Q&��z�p���͝ε��A�K���`���Q� #A��Spf����/�n��m�\�{�G�Zg�BZ�{�4�4vX1qX)ۮ�q��'fԐZ��$*�s���TEY�yf�,GS��**�я˴+6up�}�ޗ~c�b��#���\��J��TJ�	4�E�         �   x�=�˱ �c0����l�q<@w�<�]�� �Tg	�4p�~*� "*[`�
-/�"7T��$��*D���&&�~�~{���w�!��`���9ܷ�t�&�^x�}�ښ��eW��i����U��E/���e��}��Z��U/�     