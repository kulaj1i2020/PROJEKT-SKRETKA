-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2024 at 10:25 AM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `szkola_jezykowa`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `cena`
--

CREATE TABLE `cena` (
  `id_lekcji` int(11) NOT NULL,
  `Cena` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `lekcje`
--

CREATE TABLE `lekcje` (
  `ID` int(11) NOT NULL,
  `id_jezyk` int(11) NOT NULL,
  `id_wydzial` int(11) NOT NULL,
  `id_pracownicy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pracownicy`
--

CREATE TABLE `pracownicy` (
  `Id` int(64) NOT NULL,
  `Imie` varchar(64) NOT NULL,
  `Nazwisko` varchar(64) NOT NULL,
  `id_wydzialu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczniowie`
--

CREATE TABLE `uczniowie` (
  `Id` int(11) NOT NULL,
  `Imie` varchar(64) NOT NULL,
  `Nazwisko` varchar(64) NOT NULL,
  `id_jezyk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wydzialy`
--

CREATE TABLE `wydzialy` (
  `id` int(11) NOT NULL,
  `Miejscowosc` int(11) NOT NULL,
  `Kod-Pocztowy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `cena`
--
ALTER TABLE `cena`
  ADD KEY `id_lekcji` (`id_lekcji`);

--
-- Indeksy dla tabeli `lekcje`
--
ALTER TABLE `lekcje`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `id_jezyk` (`id_jezyk`,`id_wydzial`,`id_pracownicy`),
  ADD KEY `id_pracownicy` (`id_pracownicy`),
  ADD KEY `id_wydzial` (`id_wydzial`);

--
-- Indeksy dla tabeli `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Dzial` (`id_wydzialu`),
  ADD KEY `id_wydzialu` (`id_wydzialu`);

--
-- Indeksy dla tabeli `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `id_jezyk` (`id_jezyk`);

--
-- Indeksy dla tabeli `wydzialy`
--
ALTER TABLE `wydzialy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lekcje`
--
ALTER TABLE `lekcje`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pracownicy`
--
ALTER TABLE `pracownicy`
  MODIFY `Id` int(64) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `uczniowie`
--
ALTER TABLE `uczniowie`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wydzialy`
--
ALTER TABLE `wydzialy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cena`
--
ALTER TABLE `cena`
  ADD CONSTRAINT `cena_ibfk_1` FOREIGN KEY (`id_lekcji`) REFERENCES `lekcje` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `lekcje`
--
ALTER TABLE `lekcje`
  ADD CONSTRAINT `lekcje_ibfk_1` FOREIGN KEY (`id_pracownicy`) REFERENCES `pracownicy` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `lekcje_ibfk_2` FOREIGN KEY (`id_wydzial`) REFERENCES `wydzialy` (`id`);

--
-- Constraints for table `pracownicy`
--
ALTER TABLE `pracownicy`
  ADD CONSTRAINT `pracownicy_ibfk_1` FOREIGN KEY (`id_wydzialu`) REFERENCES `wydzialy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `uczniowie`
--
ALTER TABLE `uczniowie`
  ADD CONSTRAINT `uczniowie_ibfk_1` FOREIGN KEY (`id_jezyk`) REFERENCES `lekcje` (`id_jezyk`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
