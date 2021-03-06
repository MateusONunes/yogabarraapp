PGDMP         "                x            postgres    12.2     12.2 (Ubuntu 12.2-2.pgdg18.04+1)                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    14313    postgres    DATABASE     z   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE postgres;
                postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3847            	           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    3            �            1255    16401    ptrg_personal_pers()    FUNCTION     �   CREATE FUNCTION public.ptrg_personal_pers() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      New.code_pers := nextval('gen_code_pers');
      Return NEW;
    END;
$$;
 +   DROP FUNCTION public.ptrg_personal_pers();
       public          postgres    false            �            1255    16402    trigger_set_timestamp()    FUNCTION     �   CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.trigger_set_timestamp();
       public          postgres    false            �            1259    16403 
   class_clas    TABLE     /  CREATE TABLE public.class_clas (
    code_clas smallint,
    name_clas character varying(40),
    code_cors smallint,
    timestart_clas character varying(5),
    timeend_clas character varying(5),
    frequency_clas character varying(10),
    frequencyorder_clas smallint,
    description_clas text
);
    DROP TABLE public.class_clas;
       public         heap    postgres    false            �            1259    16409    course_cors    TABLE     |   CREATE TABLE public.course_cors (
    code_cors smallint,
    name_cors character varying(40),
    description_cors text
);
    DROP TABLE public.course_cors;
       public         heap    postgres    false            �            1259    16415    gen_code_pers    SEQUENCE     v   CREATE SEQUENCE public.gen_code_pers
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.gen_code_pers;
       public          postgres    false            �            1259    16417    person_pers    TABLE     `  CREATE TABLE public.person_pers (
    code_pers integer,
    name_pers character varying(100),
    birth_pers date,
    address_pers character varying(100),
    city_pers character varying(50),
    zipcode_pers character varying(15),
    cpf_pers character varying(15),
    rg_pers character varying(15),
    phonewhats_pers character varying(20),
    phone2_pers character varying(20),
    phone3_pers character varying(20),
    email_pers character varying(60),
    fisicajuridica_pers character(1),
    comments_pers text,
    password_pers character varying(200),
    login_pers character varying(60)
);
    DROP TABLE public.person_pers;
       public         heap    postgres    false            
           0    0    TABLE person_pers    COMMENT     >   COMMENT ON TABLE public.person_pers IS 'cadastro de pessoas';
          public          postgres    false    205                       0    0 &   COLUMN person_pers.fisicajuridica_pers    COMMENT     V   COMMENT ON COLUMN public.person_pers.fisicajuridica_pers IS '(F/J)Física-Jurídica';
          public          postgres    false    205            �            1259    16423    person_typeperson_ptpr    TABLE     ^   CREATE TABLE public.person_typeperson_ptpr (
    code_pers integer,
    code_ptyp smallint
);
 *   DROP TABLE public.person_typeperson_ptpr;
       public         heap    postgres    false            �            1259    16426    persontype_ptyp    TABLE     e   CREATE TABLE public.persontype_ptyp (
    code_ptyp smallint,
    name_ptyp character varying(20)
);
 #   DROP TABLE public.persontype_ptyp;
       public         heap    postgres    false            �          0    16403 
   class_clas 
   TABLE DATA           �   COPY public.class_clas (code_clas, name_clas, code_cors, timestart_clas, timeend_clas, frequency_clas, frequencyorder_clas, description_clas) FROM stdin;
    public          postgres    false    202   �"       �          0    16409    course_cors 
   TABLE DATA           M   COPY public.course_cors (code_cors, name_cors, description_cors) FROM stdin;
    public          postgres    false    203   m#       �          0    16417    person_pers 
   TABLE DATA           �   COPY public.person_pers (code_pers, name_pers, birth_pers, address_pers, city_pers, zipcode_pers, cpf_pers, rg_pers, phonewhats_pers, phone2_pers, phone3_pers, email_pers, fisicajuridica_pers, comments_pers, password_pers, login_pers) FROM stdin;
    public          postgres    false    205   �#                  0    16423    person_typeperson_ptpr 
   TABLE DATA           F   COPY public.person_typeperson_ptpr (code_pers, code_ptyp) FROM stdin;
    public          postgres    false    206   �$                 0    16426    persontype_ptyp 
   TABLE DATA           ?   COPY public.persontype_ptyp (code_ptyp, name_ptyp) FROM stdin;
    public          postgres    false    207   �$                  0    0    gen_code_pers    SEQUENCE SET     <   SELECT pg_catalog.setval('public.gen_code_pers', 34, true);
          public          postgres    false    204            x           1259    16429    fk_person_typeperson_ptpr1    INDEX     b   CREATE INDEX fk_person_typeperson_ptpr1 ON public.person_typeperson_ptpr USING btree (code_pers);
 .   DROP INDEX public.fk_person_typeperson_ptpr1;
       public            postgres    false    206            y           1259    16430    fk_person_typeperson_ptpr2    INDEX     b   CREATE INDEX fk_person_typeperson_ptpr2 ON public.person_typeperson_ptpr USING btree (code_ptyp);
 .   DROP INDEX public.fk_person_typeperson_ptpr2;
       public            postgres    false    206            w           1259    16431    pk_person_pers    INDEX     R   CREATE UNIQUE INDEX pk_person_pers ON public.person_pers USING btree (code_pers);
 "   DROP INDEX public.pk_person_pers;
       public            postgres    false    205            z           1259    16432    pk_persontype_ptyp    INDEX     Z   CREATE UNIQUE INDEX pk_persontype_ptyp ON public.persontype_ptyp USING btree (code_ptyp);
 &   DROP INDEX public.pk_persontype_ptyp;
       public            postgres    false    207            }           2620    16433    person_pers trg_person_pers_bi    TRIGGER     �   CREATE TRIGGER trg_person_pers_bi BEFORE INSERT ON public.person_pers FOR EACH ROW EXECUTE FUNCTION public.ptrg_personal_pers();
 7   DROP TRIGGER trg_person_pers_bi ON public.person_pers;
       public          postgres    false    208    205            {           2606    16434 <   person_typeperson_ptpr person_typeperson_ptpr_code_pers_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.person_typeperson_ptpr
    ADD CONSTRAINT person_typeperson_ptpr_code_pers_fkey FOREIGN KEY (code_pers) REFERENCES public.person_pers(code_pers) NOT VALID;
 f   ALTER TABLE ONLY public.person_typeperson_ptpr DROP CONSTRAINT person_typeperson_ptpr_code_pers_fkey;
       public          postgres    false    205    206    3703            |           2606    16439 <   person_typeperson_ptpr person_typeperson_ptpr_code_ptyp_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.person_typeperson_ptpr
    ADD CONSTRAINT person_typeperson_ptpr_code_ptyp_fkey FOREIGN KEY (code_ptyp) REFERENCES public.persontype_ptyp(code_ptyp) NOT VALID;
 f   ALTER TABLE ONLY public.person_typeperson_ptpr DROP CONSTRAINT person_typeperson_ptpr_code_ptyp_fkey;
       public          postgres    false    206    3706    207            �   j   x�3���4�4��24�42 �!�E��'re�� �V�� 2�43�$��$m��YD �1��26 )����y)�@M@yS�<D�!���"�v��\1z\\\ !�"�      �   M   x�3��H,�HT��OO���2�t,�(I�KOT�̫L,FHs���d�$^~xq>H��3$1S�9�K�@B1z\\\ mS�      �   �   x���=n�0�g��A�I�w,�6����p$�v
ߨ�Ū6?M�dJ.���#�����&lv^&h�d�.@�;��4YLJ@D�̿�ӆ�I�O�����MB�C��.�r/6��3�્�a��UjT�q+Q�kJ+�d��x�\��({��2+�ac����T�E����:��5�9�9o���\��b���-
���blu�$?ۢ�E             x������ � �         .   x�3�tL����,.)JL�/�2����KK�lcNǜҼ|�=... �     